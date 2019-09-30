# terminal aliases

alias vi='nvim'
alias vim='nvim'
alias ls='ls --color=aut'
alias pwd="pwd; pwd|xclip -selection clipboard"
alias grep='grep --color=auto'
alias t="sh ~/Codes/dotfiles/tmux/sessions/startup"
alias cls='clear'
alias xclip="xclip -selection clipboard"
alias :q="exit"
alias :wq="exit"
alias gotop="gotop --rate=3 --color=monokai -s"

# Aliases->Edit Configs
alias zshconfig="nvim  ~/Codes/dotfiles/zsh/zshrc"
alias aliases="nvim ~/Codes/dotfiles/zsh/aliases.sh"
alias vimconfig="nvim  ~/Codes/dotfiles/nvim/init.vim"
alias tmuxconfig="nvim ~/Codes/dotfiles/tmux/tmux.conf"

# Aliases->Dirs
alias codes="cd '$HOME'/Codes/"
alias dot="cd '$HOME'/Codes/dotfiles/"
alias dow="cd '$HOME'/Downloads/"
alias doc="cd '$HOME'/Documents/"
alias des="cd '$HOME'/Desktop/"

