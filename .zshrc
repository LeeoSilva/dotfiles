if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then 
	source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Exporting Neo-Vim as editor
export EDITOR="nvim"
export VISUAL="nvim"
export TERM=xterm-256color

## User configuration
export LANG=en_US.UTF-8

## Exporting .local to PATH
export PATH=~/.local/bin/:$PATH

# --- zinit ----
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
if [[ ! -d $ZINIT_HOME ]]; then 
	mkdir -p "$(dirname $ZINIT_HOME)"
	git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi
source "${ZINIT_HOME}/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit 

# pyenv - static shims (fast), lazy-load shell integration on first use
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PYENV_ROOT/shims:$PATH"
_pyenv_lazy_init() {
	unset -f pyenv python python3 pip pip3
	eval "$(pyenv init -)"
}
pyenv() { _pyenv_lazy_init; pyenv "$@"; } 
python() { _pyenv_lazy_init; python "$@"; } 
python3() { _pyenv_lazy_init; python3 "$@"; } 
pip() { _pyenv_lazy_init; pip "$@"; } 
pip3() { _pyenv_lazy_init; pip3 "$@"; } 

# nvm - lazy-load shell integration
export NVM_DIR="$HOME/.nvm"
[ ! -d "$NVM_DIR" ] && export NVM_DIR="/opt/homebrew/opt/nvm"
_nvm_lazy_init() {
	unset -f nvm node npm npx yarn
	[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
	[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
}
nvm() { _nvm_lazy_init; nvm "$@"; }
node() { _nvm_lazy_init; node "$@"; }
npm() { _nvm_lazy_init; npm "$@"; }
npx() { _nvm_lazy_init; npx "$@"; }
yarn() { _nvm_lazy_init; yarn "$@"; }

# Exporting android to path
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/tools

POWERLEVEL9K_MODE="nerdfont-complete"
POWERLEVEL9K_COLOR_SCHEME='dark'
POWERLEVEL9K_DISABLE_PROMPT=true

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir)

POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR=''
POWERLEVEL9K_LEFT_SUBSEGMENT_SEPARATOR=' '
POWERLEVEL9K_WHITESPACE_BETWEEN_LEFT_SEGMENTS=''

POWERLEVEL9K_ALWAYS_SHOW_USER=false
POWERLEVEL9K_DIR_BACKGROUND='none'
POWERLEVEL9K_DIR_FOREGROUND='none'
POWERLEVEL9K_ETC_ICON=''
POWERLEVEL9K_FOLDER_ICON=''
POWERLEVEL9K_HOME_ICON=''
POWERLEVEL9K_HOME_SUB_ICON=''

POWERLEVEL9K_DIR_ETC_BACKGROUND='none'
POWERLEVEL9K_DIR_ETC_FOREGROUND='005'
POWERLEVEL9K_DIR_HOME_BACKGROUND='none'
POWERLEVEL9K_DIR_HOME_FOREGROUND='004'
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND='none'
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND='005'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND='none'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND='004'

# PoweLevel9K right prompt
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status vcs virtualenv)
POWERLEVEL9K_STATUS_VERBOSE=false
POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR=' '
POWERLEVEL9K_RIGHT_SUBSEGMENT_SEPARATOR=' '
POWERLEVEL9K_WHITESPACE_BETWEEN_RIGHT_SEGMENTS=' '

POWERLEVEL9K_VCS_CLEAN_BACKGROUND='none'
POWERLEVEL9K_VCS_CLEAN_FOREGROUND='076'
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND='none'
POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND='005'
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='none'
POWERLEVEL9K_VCS_MODIFIED_FOREGROUND='003'


POWERLEVEL9K_VCS_GIT_HOOKS=(vcs-detect-changes git-untracked git-aheadbehind git-remotebranch git-tagname)

# Plugins 
zinit ice depth=1; zinit light romkatv/powerlevel10k 
zinit snippet OMZP::git 
zinit light zsh-users/zsh-autosuggestions 
zinit light zsh-users/zsh-syntax-highlighting

setopt autocd sharehistory 
unsetopt correct correct_all


# Terminal Aliases
alias grep='grep --color=auto'
alias ls='ls --color=auto'
alias la='ls -alhi --color=auto'
alias vim='nvim'
alias cat='bat --paging=never'
alias fvim='nvim $(fzf --preview="bat --color=always {}")'
alias fcode='code $(find . -type d -print | fzf)'
alias fcat='cat $(fzf)'
alias fcd='cd $(find . -type d -print | fzf)'
alias fpbcopy='/bin/cat $(fzf) | pbcopy'
alias fkill="ps -e | tail -n +2 | fzf | awk '{print \$1}' | xargs kill"

# fsearch - search content with ripgrep and open in nvim at line
fsearch() {
  local file
  local line

  read -r file line <<< "$(rg --line-number --column --no-heading --color=always --smart-case "${1:-}" | fzf --ansi --delimiter : --preview 'bat --color=always --highlight-line {2} {1}' --preview-window 'up,60%,border-bottom,+{2}+3/3' | awk -F: '{print $1, $2}')"

  if [[ -n $file ]]; then
    nvim "+$line" "$file"
  fi
}


export JAVA_HOME=${JAVA_HOME:-$(/usr/libexec/java_home)}

stty -ixon

bindkey -s "^[OM" "^M"


# NVM and other configs
export HOMEBREW_NO_AUTO_UPDATE=1
export HOMEBREW_NO_INSTALL_CLEANUP=1
export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_DOWNLOAD_TOOL=aria2


