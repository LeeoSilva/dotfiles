#!/bin/bash

TMUX="$HOME/.tmux.conf";
NVIM="$HOME/.config/nvim/init.vim";
ZSH="$HOME/.zshrc";
CWD="$(pwd)"; 

mkdir -p "$HOME/.config/"
mkdir -p "$HOME/.config/nvim/"

ln -s -f "$CWD/.tmux.conf" "$TMUX"
ln -s -f "$CWD/init.vim" "$NVIM"
ln -s -f "$CWD/.zshrc" "$ZSH"

# ZSH plugins 
# echo -e "Installing [${color_light_green}ZSH Plugins${color_nc}]";
# cp -uf zsh/prompt.sh "$zshdir" 2> /dev/null && echo -e "ZSH prompt script [${color_light_green}Installed${color_nc}]";
# sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" # Oh my zsh
# git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions  # autosuggestions
# git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting # syntax-highlighting
# git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto" # ZPrezto
# git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm # Tmux Plugin Manager 
# git clone https://github.com/romkatv/powerlevel10k.git ${ZDOTDIR:-$HOME}/.oh-my-zsh/themes/powerlevel10k

# Finishing up
echo -e "${color_light_green}All Set-up!${color_nc}";
