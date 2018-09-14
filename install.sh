#!/bin/bash

# If the script is running without root permissions
# Enter root.

function checkRoot{
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
}

checkRoot

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

COLOR_NC='\e[0m' # No Color
COLOR_GREEN='\e[0;32m'
COLOR_LIGHT_GREEN='\e[1;32m'
COLOR_RED='\e[0;31m'

echo "Installing...";

if [ ! -d "~/.fonts" ] then mkdir -p ~/.fonts && cp -uvf fonts/* $FONTS fi || echo "${COLOR_RED}Error${COLOR_NC} creating ~/.fonts";
if [ ! -d "~/.config" ] then mkdir -p ~/.config fi || echo "${COLOR_RED}Error${COLOR_NC} creating ~/.config";

cp -uf ncmpcpp/config $NCMPCPP && echo "NCMPCPP config [${COLOR_GREEN}Installed${COLOR_NC}]";
cp -uf mpd/mpd.conf $MPD; && echo "MPD config [${COLOR_GREEN}Installed${COLOR_NC}]";
cp -uf i3/config $I3; && echo "I3 config [${COLOR_GREEN}Installed${COLOR_NC}]";
cp -uf dunst/dunstrc $DUNST && echo "DUNST config [${COLOR_GREEN}Installed${COLOR_NC}]";
cp -uf conky/conkyrc $CONKY; && echo "CONKY config [${COLOR_GREEN}Installed${COLOR_NC}]";
cp -uf htop/htoprc $HTOP; && echo "HTOP config [${COLOR_GREEN}Installed${COLOR_NC}]";
cp -uf termite/config $TERMITE; && echo "TERMITE config [${COLOR_GREEN}Installed${COLOR_NC}]";
cp -uf tmux/tmux.conf $TMUX; && echo "TMUX config [${COLOR_GREEN}Installed${COLOR_NC}]";
cp -uf nvim/init.vim $VIM; && echo "NVIM config [${COLOR_GREEN}Installed${COLOR_NC}]";
cp -uf zsh/zshrc $ZSH; && echo "ZSH config [${COLOR_GREEN}Installed${COLOR_NC}]";
cp -uf zsh/prompt.sh $ZSHDIR; && echo "ZSH prompt script [${COLOR_GREEN}Installed${COLOR_NC}]";
cp -uf ranger/* $RANGER; && echo "RANGER config [${COLOR_GREEN}Installed${COLOR_NC}]";
cp -uf polybar/config $POLYBAR; && echo "POLYBAR config [${COLOR_GREEN}Installed${COLOR_NC}]";
echo "Installed";
