# Path to your oh-my-zsh installation.
  export ZSH=/home/leonardo/.oh-my-zsh

# ZSH Theme
ZSH_THEME="miloshadzic"

# Enable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="false"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=13

# Enable colors in ls.
DISABLE_LS_COLORS="false"

# Disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Enable command auto-correction.
ENABLE_CORRECTION="true"

# Display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Plugins

plugins=(
  git
  zsh-syntax-highlighting
  zsh-autosuggestions
  tmux
  tmuxinator
  colored-man-pages
  git-flow
)

source $ZSH/oh-my-zsh.sh
source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
source ~/.zsh/prompt.sh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# User configuration

export LANG=en_US.UTF-8

# Aliases
alias vim='nvim'
alias zshconfig="mate ~/.zshrc"
alias ohmyzsh="mate ~/.oh-my-zsh"
alias song-dl='youtube-dl --extract-audio --audio-format mp3 -o "/MeuBolso/Songs/%(title)s.%(ext)s"' 
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias tmux="tmux new-session -A -s main"
# Aliases->Dirs

alias hps="cd /srv/http"
alias codes="cd ~/Codes/"

# Disables CTRL+S terminal lock (better combined with VIM)
stty -ixon

