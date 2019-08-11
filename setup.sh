#!/bin/sh

# Set colors to variables
YELLOW='\033[1;33m'
PURPLE='\033[1;35m'
GREEN='\033[0;32m'
WHITE='\033[1;37m'

dependencies=(
    "sl" "trash" "screenfetch"
)

if [ $1 ]; then
    if [ $1 = "-u" ]; then
        echo "${WHITE}[${PURPLE}Updating${WHITE}] $OSTYPE"
        if [ "$OSTYPE" = "darwin18" ]; then
            /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
            for dep in ${dependencies[*]}; do
                echo "  ${WHITE}[${PURPLE}Installing${WHITE}] => " $dep
                brew install $dep
                echo "  ${WHITE}[${GREEN}DONE${WHITE}] Installed $dep successfully"
            done
        else
            sudo apt-get update && sudo apt-get upgrade
            for dep in ${dependencies[*]}; do
                echo "  ${WHITE}[${PURPLE}Installing${WHITE}] => " $dep
                apt install $dep
                echo "  ${WHITE}[${GREEN}DONE${WHITE}] Installed $dep successfully"
            done
        fi
    fi
fi
echo "${WHITE}[${PURPLE}Propagating${WHITE}] bash_aliases to home directory"
sudo cp $HOME/projects/linux-custom/.bash_aliases ~/.bash_profile
echo "  ${WHITE}[${GREEN}DONE${WHITE}] cp >> ~/.bash_profile"
sudo cp $HOME/projects/linux-custom/.bash_aliases ~/.bashrc
echo "  ${WHITE}[${GREEN}DONE${WHITE}] cp >> ~/.bashrc"
echo "${WHITE}[${YELLOW}WARN${WHITE}] Run . ~/.bash_profile or restart shell"