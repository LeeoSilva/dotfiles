#!/bin/bash

# For developing purposes, this file updates this hole branch based on
# the files of the user.

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
vim="$HOME/.config/nvim/init.vim";
zsh="$HOME/.zshrc";
zshprompt="$HOME/.zsh/prompt.sh";
ncmpcpp="$HOME/.ncmpcpp/config";
mpd="$HOME/.config/mpd/mpd.conf";
path="$(pwd)";

color_nc='\033[0m';
color_light_green='\033[1;32m';

cp -uf "$fonts" "$path"/fonts/ 2> /dev/null && echo -e "FONTS [${color_light_green}UPDATED{$color_nc}];"
cp -uf "$compton" "$path"/compton/compton.conf 2> /dev/null && echo -e "COMPTON [${color_light_green}UPDATED${color_nc}];"
cp -uf "$htop" "$path"/htop/htoprc 2> /dev/null && echo -e "HTOP [${color_light_green}UPDATED${color_nc}];"
cp -uf "$termite" "$path"/termite/config 2> /dev/null && echo -e "TERMITE [${color_light_green}UPDATED${color_nc}];"
cp -uf "$i3" "$path"/i3/ 2> /dev/null && echo -e "I3 [${color_light_green}UPDATED${color_nc}];"
cp -uf "$zsh" "$path"/zsh/zshrc 2> /dev/null && echo -e "ZSH config[${color_light_green}UPDATED${color_nc}];"
cp -uf "$zshprompt" "$path"/zsh/prompt.sh 2> /dev/null && echo -e "ZSH prompt script[${color_light_green}UPDATED${color_nc}];"
cp -uf "$conky" "$path"/conky/conkyrc 2> /dev/null && echo -e "CONKY [${color_light_green}UPDATED${color_nc}];"
cp -uf "$vim" "$path"/nvim/init.vim 2> /dev/null && echo -e "VIM [${color_light_green}UPDATED${color_nc}];"
cp -uf "$tmux" "$path"/tmux/tmux.conf 2> /dev/null && echo -e "TMUX [${color_light_green}UPDATED${color_nc}];"
cp -uf "$ranger" "$path"/ranger/ 2> /dev/null && echo -e "RANGER [${color_light_green}UPDATED${color_nc}];"
cp -uf "$polybar" "$path"/polybar/ 2> /dev/null && echo -e "POLYBAR [${color_light_green}UPDATED${color_nc}];"
cp -uf "$dunst" "$path"/dunst/ 2> /dev/null && echo -e "DUNST [${color_light_green}UPDATED${color_nc}];"
cp -uf "$ncmpcpp" "$path"/ncmpcpp/ 2> /dev/null && echo -e "NCMPCPP [${color_light_green}UPDATED${color_nc}];"
cp -uf "$mpd" "$path"/mpd/ 2> /dev/null && echo -e "MPD [${color_light_green}UPDATED${color_nc}];"
