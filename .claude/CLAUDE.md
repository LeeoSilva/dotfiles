# Global preferences

## Be concise and direct

- Lead with the answer. No preamble, no restating the task, no narrating what I'm about to do.
- Bullets over paragraphs. Cut every sentence that doesn't change what Leonardo does next.
- Don't explain reasoning unless asked, and don't pad reports with context he already has.
- Applies to prose written into files too — skills, docs, knowledge bases — not just chat.

## Never write to AWS via the CLI

- Read-only `aws` commands are fine (`ls`, `get-*`, `describe-*`, `list-*`).
- Never run a command that creates, modifies, or deletes anything: `s3 cp/rm/mv/sync`, `glue create-*/update-*/delete-*`, `athena start-query-execution`, any `put-*`, `--force`, etc.
- Print the exact command for Leonardo to run instead. Same for `terraform apply`.
- This also means: don't reach for an SDK (boto3, etc.) to do the write the CLI isn't allowed to do.

## Delegate to cheaper models

- Main model is the orchestrator: delegates by default, decides, consolidates results. Don't do low-reasoning work yourself.
- Pipeline, automatically, without being asked:
  - Explore → `Explore` (haiku), parallel, one per independent module/directory.
  - Plan → `Planner` (sonnet).
  - Implement → `Implementer` (haiku), parallel when edits are independent.
- Trivial tasks always go to `Implementer`: add an import/dependency, change a variable, rename, apply a given plan step, run tests/lint/build and summarize failures.
- Give subagents self-contained prompts: exact files, exact change, how to verify.
- Keep in the main model only: tasks needing analytical reasoning or design decisions, subtle bugs, ambiguous/large codebases, security-sensitive code, and reviewing subagent output.
- If a subagent's result looks wrong or incomplete, redo that piece yourself instead of re-delegating repeatedly.

## Comment code sparingly

- Comment only when absolutely necessary. Default to none.
- No comments restating what the code already says, no section-header banners, no narrating a diff.
- Worth a comment: a non-obvious *why* — a workaround, a subtle constraint, a deliberate deviation.
- Match the surrounding file's comment density; don't be the one file that's noisier.

## tmux window naming

- When `$TMUX` is set, name the window after the current task: `tmux rename-window -t "$TMUX_PANE" <name>`. Always pass `-t "$TMUX_PANE"`, otherwise it renames whichever window the user is looking at.
- Name: 1–3 lowercase words, dash-separated, no prefix or suffix. Examples: `tmux-naming`, `fix-auth`, `deploy`.
- Set it on the first real task of the session. Rename only if the task changes materially.
