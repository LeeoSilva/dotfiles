#!/bin/bash

# If the script is running without root permissions
# Enter root.
  
if [ $EUID == "0" ]
	then
		echo -e "You are running this with root permissions and the files will be installed in /root";
		echo -e "Installing in 3...";
		sleep 1;
		echo -e "Installing in 2...";
		sleep 1;
		echo -e "Installing in 1...";
		sleep 1;
fi
 

# Variables for the PATH of all config files
conky="$HOME/.conkyrc";
compton="$HOME/.config/compton.conf";
dunst="$HOME/.config/dunst/dunstrc";
fonts="$HOME/.fonts/";
htop="$HOME/.config/htop/htoprc";
i3="$HOME/.config/i3/config";
polybar="$HOME/.config/polybar/config";
ranger="$HOME/.config/ranger/";
termite="$HOME/.config/termite/config";
tmux="$HOME/.tmux.conf";
tmuxsession="$HOME/.tmux/sessions/startup"
vim="$HOME/.config/nvim/init.vim";
zsh="$HOME/.zshrc";
zshdir="$HOME/.zsh/";
ncmpcpp="$HOME/.ncmpcpp/config";
mpd="$HOME/.config/mpd/mpd.conf";
path="$(pwd)"; # One day i'll fix this '-'

color_nc='\033[0m'; # No Color
color_light_green='\033[1;32m';

if [ ! -d "$HOME/.fonts" ]; then mkdir -p "$fonts"; fi
if [ ! -d "$HOME/.config" ]; then mkdir -p "$HOME/.config"; fi
if [ ! -d "$HOME/.zsh" ]; then mkdir -p "$HOME/.zsh"; fi
if [ ! -d "$HOME/.tmux/sessions/" ]; then mkdir -p "$HOME/.tmux/sessions/	"; fi
if [ ! -d "$HOME/.config/nvim" ]; then mkdir -p "$HOME/.config/nvim/	"; fi

echo "source $path/zsh/zshrc" >> $zsh 
echo "source $path/./"

