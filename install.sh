#!/bin/bash

# If the script is running without root permissions
# Enter root.
checkRoot = id -u $USER
if [ checkRoot == "1000" ]
	then # Running with sudo
		echo "You are running this with root permissions and the files will be installed in /root";
		echo "Installing in 3...";
		sleep 1;
		echo "Installing in 2...";
		sleep 1;
		echo "Installing in 1...";
		sleep 1;
fi

# Variables for the PATH of all config files
COMPTON="~/.config/compton.conf";
CONKY="~/.conkyrc";
DUNST="/home/leonardo/.config/dunst/dunstrc";
FONTS="~/.fonts/";
HTOP="~/.config/htop/htoprc";
I3="~/.config/i3/config";
POLYBAR="~/.config/polybar/config";
RANGER="~/.config/ranger/";
TERMITE="~/.config/termite/config";
TMUX="~/.tmux.conf";
VIM="~/.config/nvim/init.vim";
ZSH="~/.zshrc";
ZSHDIR="~/.zsh/";
NCMPCPP="~/.ncmpcpp/config";
MPD="~/.config/mpd/mpd.conf";

if [ ! -d "~/.fonts" ] then mkdir -p ~/.fonts fi;

echo "Installing...";

cp -uvf fonts/* $FONTS;
cp -uvf ncmpcpp/config $NCMPCPP;
cp -uvf mpd/mpd.conf $MPD;
cp -uvf i3/config $I3;
cp -uvf dunst/dunstrc $DUNST
cp -uvf conky/conkyrc $CONKY;
cp -uvf htop/htoprc $HTOP;
cp -uvf termite/config $TERMITE;
cp -uvf tmux/tmux.conf $TMUX;
cp -uvf nvim/init.vim $VIM;
cp -uvf zsh/zshrc $ZSH;
cp -uvf zsh/prompt.sh $ZSHDIR;
cp -uvf ranger/* $RANGER;
cp -uvf polybar/config $POLYBAR;
echo "Installed";
