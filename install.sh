#!/usr/bin/env bash

source ./colors.sh
source ./install_functions.sh
source ./zsh/zshenv

################
# presentation #
################

echo -e "
${yellow}
⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⣀⡤⠊⢉⠖⠉⡰⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠠⠋⠌⠀⠀⠀⢀⠜⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⢠⠃⠀⠀⠀⠀⢠⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⢸⠀⠀⠀⠀⠀⡎⠀⡠⠒⠈⠉⠀⠉⠑⠢⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⢸⠀⢰⡒⠠⠤⢄⡜⠀⠀⠀⣠⣀⠀⠀⠀⠘⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠘⡄⠀⠩⣁⠒⠤⠌⢱⠀⠀⠙⠋⠀⠀⠀⠀⠸⠤⠤⠤⠤⣀⠀⢀⡠⣦⠴⣆⡀
⠀⠹⡄⠀⠀⠉⢦⠀⠁⠀⠀⠀⠀⠀⠀⠀⠰⠃⠀⠀⠀⠀⠀⠙⠁⠚⢡⠞⡱⠇
⠀⠀⠘⢆⠀⠀⠈⢣⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⡰⠁
⠀⠀⠀⠀⠙⠦⢀⡜⠀⠉⠀⠀⠀⠀⠀⡄⠀⠔⢹⠤⢢⠤⠊⢱⠀⠀⠀⡎⠀⠀
⠀⠀⠀⠀⠀⠀⠀⡇⠀⠀⠀⠀⠀⠀⢸⠀⠀⠀⠁⠀⠁⠀⢀⠇⠀⠀⢠⠁⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠰⡀⠀⠀⠀⠀⠀⠘⢆⠀⠀⠀⠀⢀⠴⠃⠀⠀⢠⠃⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠙⢄⠀⠀⠀⠀⠀⠀⠉⠒⠒⠈⠁⠀⠀⢀⡴⠁⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠢⢄⣀⡀⠀⠀⠀⠀⣀⣀⠠⠔⠋⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠀⡄⠀⠉⠁⢸⠈⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠤⢽⣿⡀⠤⠃⠀⢀⡀⠼⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠀⠀⠀⠀⠐⡛⠗⠐⠚⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
+------------------------------+
|  Welcome to ${blue}golvin ${magenta}dotfiles${default} |
+------------------------------+

"

echo -e "${yellow}!!! ${red}WARNING${yellow} !!!"
echo -e "${light_red}This script will delete all your configuration files!"
echo -e "${light_red}Use it at your own risks."

if [ $# -ne 1 ] || [ "$1" != "-y" ];
    then
        echo -e "${yellow}(y)es to continue, (n)o to cancel: ${default}"
        read key;
fi

if [ "$key" != "y" ] && [ "$key" != "-y" ] && [ "$1" != "-y" ]; then
    echo -e "${red}Installation cancelled.${default}"
    exit 1
fi

###########
# INSTALL #
###########

. "$DOTFILES/install/install-zsh.sh"
. "$DOTFILES/install/install-fonts.sh"

dot_is_installed kitty && dot_install kitty
