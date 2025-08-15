#!/bin/bash

TMUX="$HOME/.tmux.conf";
NVIM="$HOME/.config/nvim/init.vim";
GHOSTTY="$HOME/.config/ghostty/config";
ZSH="$HOME/.zshrc";
CWD="$(pwd)"; 

mkdir -p "$HOME/.config/"
mkdir -p "$HOME/.config/nvim/"
mkdir -p "$HOME/.config/ghostty/"

ln -s -f "$CWD/.tmux.conf" "$TMUX"
ln -s -f "$CWD/.config/nvim/init.vim" "$NVIM"
ln -s -f "$CWD/.config/ghostty/init.vim" "$GHOSTTY"
ln -s -f "$CWD/.zshrc" "$ZSH"

# ZSH plugins 
echo -e "Installing [ZSH Plugins]";
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" # Oh my zsh
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions  # autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting # syntax-highlighting
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto" # ZPrezto
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm # Tmux Plugin Manager 
git clone https://github.com/romkatv/powerlevel10k.git "${ZDOTDIR:-$HOME}/.oh-my-zsh/themes/powerlevel10k"

# Finishing up
echo -e "All Set-up!";
