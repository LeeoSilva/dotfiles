#!/bin/bash

# Self-Explanatory name '-'

echo "Installing...";
cp -f conky/conky.conf /home/$USER/.conky.conf;
cp -f htop/htoprc /home/$USER/.config/htop/htoprc;
cp -f termite/config /home/$USER/.config/termite/config;
cp -f tmux/tmux.conf /home/$USER/.tmux.conf;
cp -f vim/vimrc /home/$USER/.vimrc;
cp -f zsh/zshrc /home/$USER/.zshrc;
echo "Installed";
