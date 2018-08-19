#!/bin/bash

# For developing purposes, this file updates this hole branch based on
# the files of the user.

COMPTON="/home/$USER/.config/compton.conf";
CONKY="/home/$USER/.conkyrc";
DUNST="/home/leonardo/.config/dunst/dunstrc";
FONTS="/home/$USER/.fonts/*";
HTOP="/home/$USER/.config/htop/htoprc";
I3="/home/$USER/.config/i3/*";
POLYBAR="/home/$USER/.config/polybar/config";
RANGER="/home/$USER/.config/ranger/*";
TERMITE="/home/$USER/.config/termite/config";
TMUX="/home/$USER/.tmux.conf";
VIM="/home/$USER/.vimrc";
ZSH="/home/$USER/.zshrc";
ZSHPROMPT="/home/$USER/.zsh/prompt.sh"
NCMPCPP="/home/$USER/.ncmpcpp/config";
MPD="/home/$USER/.config/mpd/mpd.conf";
$PATH=$(pwd)_

echo "Updating...";
cp -uvf $COMPTON $PATH/compton/compton.conf
cp -uvf $HTOP $PATH/htop/htoprc
cp -uvf $TERMITE $PATH/termite/config
cp -uvf $I3 $PATH/i3/
cp -uvf $ZSH $PATH/zsh/zshrc
cp -uvf $ZSH $PATH/zsh/prompt.sh
cp -uvf $CONKY $PATH/conky/conkyrc;
cp -uvf $VIM $PATH/nvim/init.vim;
cp -uvf $TMUX $PATH/tmux/tmux.conf;
cp -uvf $RANGER $PATH/ranger/;
cp -uvf $POLYBAR $PATH/polybar/;
cp -uvf $FONTS $PATH/fonts/;
cp -uvf $DUNST $PATH/dunst/;
cp -uvf $NCMPCPP $PATH/ncmpcpp/;
cp -uvf $MPD $PATH/mpd/;
echo "Updated!";
