#!/bin/sh

dependencies=(
    "sl" "trash" "screenfetch"
)

if [ $1 ]; then
    if [ $1 = "-u" ]; then
        echo "[Updating] $OSTYPE...\n"
        if [ "$OSTYPE" = "darwin18" ]; then
            /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
            for dep in ${dependencies[*]}; do
                echo "  [Installing] => " $dep
                brew install $dep
            done
        else
            sudo apt-get update && sudo apt-get upgrade
            for dep in ${dependencies[*]}; do
                echo "  [Installing] => " $dep
                apt install $dep
            done
        fi
    elif [ $1 = "-b" ]; then
        echo "[Backup] /etc/profile"
        sudo cp /etc/profile /etc/profile.bck
    fi
fi
echo "[Propagating] bash_aliases to /etc/profile"
sudo cp $HOME/projects/linux-custom/.bash_aliases /etc/profile
echo "====> Please run source '/etc/profile' or restart shell <===="