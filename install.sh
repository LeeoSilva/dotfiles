#!/bin/bash

# Self-Explanatory name '-'


echo "Installing...";
cp -uvf fonts/* /home/$USER/.fonts/
cp -uvf i3/config /home/$USER/.config/i3/config
cp -uvf compton/compton.conf /home/$USER/.config/compton.conf
cp -uvf conky/conky.conf /home/$USER/.conky.conf;
cp -uvf htop/htoprc /home/$USER/.config/htop/htoprc;
cp -uvf termite/config /home/$USER/.config/termite/config;
cp -uvf tmux/tmux.conf /home/$USER/.tmux.conf;
cp -uvf vim/vimrc /home/$USER/.vimrc;
cp -uvf zsh/zshrc /home/$USER/.zshrc;
cp -uvf ranger/* /home/$USER/.config/ranger/
echo "Installed";
