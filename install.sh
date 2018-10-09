#!/bin/bash

# If the script is running without root permissions
# Enter root.
if [ $EUID == "0" ] then
	echo -e "You are running this with root permissions and the files will be installed in /root";
	echo -e "Installing in 3...";
	sleep 1;
	echo -e "Installing in 2...";
	sleep 1;
	echo -e "Installing in 1...";
	sleep 1;
fi

# Variables for the PATH of all config files
conky="~/.conkyrc";
compton="~/.config/compton.conf";
dunst="~/.config/dunst/dunstrc";
fonts="~/.fonts/";
htop="~/.config/htop/htoprc";
i3="~/.config/i3/config";
polybar="~/.config/polybar/config";
ranger="~/.config/ranger/";
termite="~/.config/termite/config";
tmux="~/.tmux.conf";
vim="~/.config/nvim/init.vim";
zsh="~/.zshrc";
zshdir="~/.zsh/";
ncmpcpp="~/.ncmpcpp/config";
mpd="~/.config/mpd/mpd.conf";

color_nc='\033[0m'; # No Color
color_light_green='\033[1;32m';

if [ ! -d "$HOME/.fonts" ]; then mkdir -p "$fonts"; fi
if [ ! -d "$HOME/.config" ]; then mkdir -p "$HOME/.config"; fi

cp -uf fonts/* "$fonts" 2> /dev/null && echo -e "Fonts [${color_light_green}Installed${color_nc}]";
cp -uf ncmpcpp/config "$ncmpcpp" 2> /dev/null && echo -e "NCMPCPP config [${color_light_green}Installed${color_nc}]";
cp -uf mpd/mpd.conf "$mpd" 2> /dev/null && echo -e "MPD config [${color_light_green}Installed${color_nc}]";
cp -uf i3/config "$i3" 2> /dev/null && echo -e "I3 config [${color_light_green}Installed${color_nc}]";
cp -uf dunst/dunstrc "$dunst" 2> /dev/null && echo -e "DUNST config [${color_light_green}Installed${color_nc}]";
cp -uf conky/conkyrc "$conky" 2> /dev/null && echo -e "CONKY config [${color_light_green}Installed${color_nc}]";
cp -uf htop/htoprc "$htop" 2> /dev/null && echo -e "HTOP config [${color_light_green}Installed${color_nc}]";
cp -uf termite/config "$termite" 2> /dev/null && echo -e "TERMITE config [${color_light_green}Installed${color_nc}]";
cp -uf tmux/tmux.conf "$tmux" 2> /dev/null && echo -e "TMUX config [${color_light_green}Installed${color_nc}]";
cp -uf nvim/init.vim "$vim" 2> /dev/null && echo -e "NVIM config [${color_light_green}Installed${color_nc}]";
cp -uf zsh/zshrc "$zsh" 2> /dev/null && echo -e "ZSH config [${color_light_green}Installed${color_nc}]";
cp -uf zsh/prompt.sh "$zshdir" 2> /dev/null && echo -e "ZSH prompt script [${color_light_green}Installed${color_nc}]";
cp -uf ranger/* "$ranger" 2> /dev/null && echo -e "RANGER config [${color_light_green}Installed${color_nc}]";
cp -uf polybar/config "$polybar" 2> /dev/null && echo -e "POLYBAR config [${color_light_green}Installed${color_nc}]";
