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

color_nc='\033[0m'; # No Color
color_light_green='\033[1;32m';

if [ ! -d "$HOME/.fonts" ]; then mkdir -p "$fonts"; fi
if [ ! -d "$HOME/.config" ]; then mkdir -p "$HOME/.config"; fi
if [ ! -d "$HOME/.zsh" ]; then mkdir -p "$HOME/.zsh"; fi
if [ ! -d "$HOME/.tmux/sessions/" ]; then mkdir -p "$HOME/.tmux/sessions/	"; fi

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
cp -uf ranger/* "$ranger" 2> /dev/null && echo -e "RANGER config [${color_light_green}Installed${color_nc}]";
cp -uf polybar/config "$polybar" 2> /dev/null && echo -e "POLYBAR config [${color_light_green}Installed${color_nc}]";

# ZSH plugin
echo -e "Installing [${color_light_green}ZSH Plugins${color_nc}]";

cp -uf zsh/prompt.sh "$zshdir" 2> /dev/null && echo -e "ZSH prompt script [${color_light_green}Installed${color_nc}]";
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions 2> /dev/null # autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting 2> /dev/null # syntax-highlighting
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto" 2> /dev/null

# Installing TMUX Sessions
echo -e "Installing [${color_light_green}TMUX Sessions${color_nc}]";
cp -urf tmux/sessions/* "$tmuxsession" 2> /dev/null && echo -e "TMUX sessions [${color_light_green}Installed${color_nc}]";

# Installing VIM Plugins
echo -e "Installing [${color_light_green}NEOVIM Plugins${color_nc}]";
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim;
vim -c :PlugInstall -c :q! -c q!;

# Finishing up
echo -e "${color_light_green}All Set-up!${color_nc}";
