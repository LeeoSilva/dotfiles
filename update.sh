#!/bin/bash

# For developing purposes, this file updates this hole branch based on
# the files of the user.

COMPTON="/home/$USER/.config/compton.conf";
CONKY="/home/$USER/.conkyrc";
DUNST="/home/leonardo/.config/dunst/dunstrc";
FONTS="/home/$USER/.fonts/*";
HTOP="/home/$USER/.config/htop/htoprc";
I3="/home/$USER/.config/i3/config";
POLYBAR="/home/$USER/.config/polybar/config";
RANGER="/home/$USER/.config/ranger/*";
TERMITE="/home/$USER/.config/termite/config";
TMUX="/home/$USER/.tmux.conf";
VIM="/home/$USER/.vimrc";
ZSH="/home/$USER/.zshrc";
NCMPCPP="/home/$USER/.ncmpcpp/config";
MPD="/home/$USER/.config/mpd/mpd.conf";

echo "Updating...";
cp -uvf $COMPTON /MeuBolso/Codes/dotfiles/compton/compton.conf;
cp -uvf $HTOP /MeuBolso/Codes/dotfiles/htop/htoprc;
cp -uvf $TERMITE /MeuBolso/Codes/dotfiles/termite/config;
cp -uvf $I3 /MeuBolso/Codes/dotfiles/i3/config;
cp -uvf $ZSH /MeuBolso/Codes/dotfiles/zsh/zshrc;
cp -uvf $CONKY /MeuBolso/Codes/dotfiles/conky/conkyrc;
cp -uvf $VIM /MeuBolso/Codes/dotfiles/vim/vimrc;
cp -uvf $TMUX /MeuBolso/Codes/dotfiles/tmux/tmux.conf;
cp -uvf $RANGER /MeuBolso/Codes/dotfiles/ranger/;
cp -uvf $POLYBAR /MeuBolso/Codes/dotfiles/polybar/;
cp -uvf $FONTS /MeuBolso/Codes/dotfiles/fonts/;
cp -uvf $DUNST /MeuBolso/Codes/dotfiles/dunst/;
cp -uvf $NCMPCPP /MeuBolso/Codes/dotfiles/ncmpcpp/;
cp -uvf $MPD /MeuBolso/Codes/dotfiles/mpd/;
echo "Updated!";
