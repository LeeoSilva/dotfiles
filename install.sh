#!/bin/bash

TMUX="$HOME/.tmux.conf";
NVIM="$HOME/.config/nvim/init.vim";
GHOSTTY="$HOME/.config/ghostty/config";
ZSH="$HOME/.zshrc";
CWD="$(pwd)"; 

mkdir -p "$HOME/.config/"
mkdir -p "$HOME/.config/nvim/"
mkdir -p "$HOME/.config/ghostty/"

ln -sf "$CWD/.tmux.conf" "$TMUX"
ln -sf "$CWD/.config/nvim/init.vim" "$NVIM"
ln -sf "$CWD/.config/ghostty/config" "$GHOSTTY"
ln -sf "$CWD/.zshrc" "$ZSH"

[ ! -d "$HOME/.oh-my-zsh" ] && sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" 
[ ! -d "$HOME/.zsh/zsh-autosuggestions" ] && git clone https://github.com/zsh-users/zsh-autosuggestions "$HOME/.zsh/zsh-autosuggestions" 
[ ! -d "$HOME/.zsh/zsh-syntax-highlighting" ] && git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$HOME/.zsh/zsh-syntax-highlighting" 
[ ! -d "${ZDOTDIR:-$HOME}/.zprezto" ] && git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto" 
[ ! -d "${ZDOTDIR:-$HOME}/.oh-my-zsh/themes/powerlevel10k" ] && git clone https://github.com/romkatv/powerlevel10k.git "${ZDOTDIR:-$HOME}/.oh-my-zsh/themes/powerlevel10k" 

exit 0
