#!/usr/bin/env bash
input=$(cat)

have_jq=0
command -v jq >/dev/null 2>&1 && have_jq=1

if [ "$have_jq" = "1" ]; then
  model=$(printf '%s' "$input" | jq -r '.model.display_name // "?"')
  cwd=$(printf '%s' "$input" | jq -r '.workspace.current_dir // .cwd // "?"')
  used_tok=$(printf '%s' "$input" | jq -r '.context_window.used_tokens // .context_window.total_input_tokens // empty' 2>/dev/null)
  ctx_size=$(printf '%s' "$input" | jq -r '.context_window.context_window_size // .context_window.max_tokens // empty' 2>/dev/null)
  used_pct=$(printf '%s' "$input" | jq -r '.context_window.used_percentage // empty' 2>/dev/null)
  cost=$(printf '%s' "$input" | jq -r '.cost.total_cost_usd // empty')
else
  model=$(printf '%s' "$input" | python3 -c 'import json,sys
d=json.load(sys.stdin)
print(d.get("model",{}).get("display_name","?"))' 2>/dev/null)
  cwd=$(printf '%s' "$input" | python3 -c 'import json,sys
d=json.load(sys.stdin)
ws=d.get("workspace") or {}
print(ws.get("current_dir") or d.get("cwd") or "?")' 2>/dev/null)
  IFS='|' read -r used_tok ctx_size used_pct <<< "$(printf '%s' "$input" | python3 -c 'import json,sys
d=json.load(sys.stdin)
cw=d.get("context_window") or {}
tok=cw.get("used_tokens") or cw.get("total_input_tokens")
size=cw.get("context_window_size") or cw.get("max_tokens")
pct=cw.get("used_percentage")
print("|".join("" if v is None else str(v) for v in (tok,size,pct)))' 2>/dev/null)"
  cost=$(printf '%s' "$input" | python3 -c 'import json,sys
d=json.load(sys.stdin)
c=d.get("cost") or {}
v=c.get("total_cost_usd")
print(v if v is not None else "")' 2>/dev/null)
fi

[ -z "$cwd" ] && cwd="$PWD"
dir_base=$(basename "$cwd")

branch=""
if git -C "$cwd" --no-optional-locks rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  branch=$(git -C "$cwd" --no-optional-locks branch --show-current 2>/dev/null)
fi

# Monthly cost across all sessions, via ccusage (token counts x model pricing).
# ccusage takes seconds, so serve a cached value and refresh in the background
# at most every 10 min. A lock dir prevents concurrent refreshes; stale locks
# (>5 min, e.g. a crashed refresh) are reclaimed.
mon_cost=""
if [ "$have_jq" = "1" ] && command -v npx >/dev/null 2>&1; then
  cache_dir="$HOME/.claude/cache"
  cache="$cache_dir/monthly-cost.txt"
  lock="$cache_dir/monthly-cost.lock"
  mkdir -p "$cache_dir"
  now=$(date +%s)
  cache_age=999999
  [ -f "$cache" ] && cache_age=$(( now - $(stat -f %m "$cache" 2>/dev/null || echo 0) ))
  if [ -d "$lock" ]; then
    lock_age=$(( now - $(stat -f %m "$lock" 2>/dev/null || echo 0) ))
    [ "$lock_age" -gt 300 ] && rmdir "$lock" 2>/dev/null
  fi
  if [ "$cache_age" -gt 600 ] && mkdir "$lock" 2>/dev/null; then
    (
      npx -y ccusage@latest monthly --json 2>/dev/null \
        | jq -r --arg m "$(date +%Y-%m)" \
            '.monthly[] | select(.period == $m) | .totalCost' > "$cache.tmp" \
        && [ -s "$cache.tmp" ] && mv "$cache.tmp" "$cache"
      rm -f "$cache.tmp"
      rmdir "$lock" 2>/dev/null
    ) >/dev/null 2>&1 &
    disown 2>/dev/null
  fi
  [ -s "$cache" ] && mon_cost=$(cat "$cache")
fi

RESET="\033[0m"
DIM="\033[2m"
CYAN="\033[36m"
YELLOW="\033[33m"
GREEN="\033[32m"
MAGENTA="\033[35m"
BLUE="\033[34m"

hum() {
  awk -v n="$1" 'BEGIN{
    if (n >= 1e6) { v = n/1e6; printf (v == int(v) ? "%.0fM" : "%.1fM"), v }
    else if (n >= 1000) printf "%.0fk", n/1000
    else printf "%d", n
  }'
}

[ -z "$used_pct" ] && [ -n "$used_tok" ] && [ -n "$ctx_size" ] \
  && used_pct=$(awk -v t="$used_tok" -v s="$ctx_size" 'BEGIN{printf "%f", t/s*100}')

ctx_str=""
if [ -n "$used_tok" ] && [ -n "$ctx_size" ]; then
  ctx_str="ctx $(hum "$used_tok")/$(hum "$ctx_size")"
  [ -n "$used_pct" ] && ctx_str="$ctx_str $(awk -v p="$used_pct" 'BEGIN{printf "(%.0f%%)", p}')"
elif [ -n "$used_pct" ]; then
  ctx_str=$(awk -v p="$used_pct" 'BEGIN{printf "ctx %.0f%%", p}')
fi

cost_str=""
[ -n "$cost" ] && cost_str=$(awk -v c="$cost" 'BEGIN{printf "$%.2f", c}')

out="${DIM}${dir_base}${RESET}"
[ -n "$branch" ] && out="${out} ${DIM}│${RESET} ${GREEN}${branch}${RESET}"
out="${out} ${DIM}│${RESET} ${CYAN}${model}${RESET}"
[ -n "$ctx_str" ] && out="${out} ${DIM}│${RESET} ${YELLOW}${ctx_str}${RESET}"
[ -n "$cost_str" ] && out="${out} ${DIM}│${RESET} ${MAGENTA}${cost_str}${RESET}"
[ -n "$mon_cost" ] && out="${out} ${DIM}│${RESET} ${BLUE}$(awk -v c="$mon_cost" 'BEGIN{printf "mo $%.2f", c}')${RESET}"

printf "%b\n" "$out"
