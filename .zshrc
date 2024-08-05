# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Exporting Neo-Vim as editor
export EDITOR="nvim"
export VISUAL="nvim"
export TERM=xterm-256color

## User configuration
export LANG=en_US.UTF-8

## Exporting .local to PATH
export PATH=~/.local/bin/:$PATH

# Exporting android to path
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/tools

# GCP Cloud sdk
source "$(brew --prefix)/share/google-cloud-sdk/path.zsh.inc"
source "$(brew --prefix)/share/google-cloud-sdk/completion.zsh.inc"


# ZSH Theme
ZSH_THEME=powerlevel10k/powerlevel10k

# POWERLEVEL9K CONFIG 
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

# Enable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="false"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=7

# Enable colors in ls.
DISABLE_LS_COLORS="false"

# Disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Enable command auto-correction.
ENABLE_CORRECTION="false"
DISABLE_CORRECTION="true"

# Display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Assume "cd" when a command is a directory
setopt autocd

# Share the same history between all shells
setopt sharehistory

# Disables auto-correction
unsetopt correct
unsetopt correct_all

plugins=(
  git
  tmux
  tmuxinator
  colored-man-pages
  git-flow
  pyenv
)

# Terminal Aliases
alias grep='grep --color=auto'
alias vim='nvim'

source $ZSH/oh-my-zsh.sh
source "${ZDOTDIR:-$HOME}/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "${ZDOTDIR:-$HOME}/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

# Disables CTRL+S and CTRL+Q on the terminal
stty -ixon

# Enter key is mapped to be used.
bindkey -s "^[OM" "^M"
