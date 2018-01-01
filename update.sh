#!/bin/bash

# For developing purposes, this file updates this hole branch based on
# the files of the user.

echo "Updating...";
cp -uvf /home/$USER/.config/compton.conf /MeuBolso/Codes/dotfiles/compton/compton.conf;
cp -uvf /home/$USER/.config/htop/htoprc /MeuBolso/Codes/dotfiles/htop/htoprc;
cp -uvf /home/$USER/.config/termite/config /MeuBolso/Codes/dotfiles/termite/config;
cp -uvf /home/$USER/.config/i3/config /MeuBolso/Codes/dotfiles/i3/config;
cp -uvf /home/$USER/.zshrc /MeuBolso/Codes/dotfiles/zsh/zshrc;
cp -uvf /home/$USER/.conkyrc /MeuBolso/Codes/dotfiles/conky/conkyrc;
cp -uvf /home/$USER/.vimrc /MeuBolso/Codes/dotfiles/vim/vimrc;
cp -uvf /home/$USER/.tmux.conf /MeuBolso/Codes/dotfiles/tmux/tmux.conf;
echo "Updated!";
