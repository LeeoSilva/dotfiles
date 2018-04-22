#!/bin/bash

# Self-Explanatory name '-'
COMPTON="/home/$USER/.config/compton.conf";
CONKY="/home/$USER/.conkyrc";
DUNST="/home/leonardo/.config/dunst/dunstrc";
FONTS="/home/$USER/.fonts/";
HTOP="/home/$USER/.config/htop/htoprc";
I3="/home/$USER/.config/i3/config";
POLYBAR="/home/$USER/.config/polybar/config";
RANGER="/home/$USER/.config/ranger/";
TERMITE="/home/$USER/.config/termite/config";
TMUX="/home/$USER/.tmux.conf";
VIM="/home/$USER/.config/nvim/init.vim";
ZSH="/home/$USER/.zshrc";
NCMPCPP="/home/$USER/.ncmpcpp/config";
MPD="/home/$USER/.config/mpd/mpd.conf";

echo "Installing...";
cp -uvf fonts/* $FONTS;
cp -uvf ncmpcpp/config $NCMPCPP;
cp -uvf mpd/mpd.conf $MPD;
cp -uvf i3/config $I3;
cp -uvf dunst/dunstrc $DUNST
cp -uvf compton/compton.conf $COMPTON;
cp -uvf conky/conkyrc $CONKY;
cp -uvf htop/htoprc $HTOP;
cp -uvf termite/config $TERMITE;
cp -uvf tmux/tmux.conf $TMUX;
cp -uvf nvim/init.vim $VIM;
cp -uvf zsh/zshrc $ZSH;
cp -uvf ranger/* $RANGER;
cp -uvf polybar/config $POLYBAR;
echo "Installed";
