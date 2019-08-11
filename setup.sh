#!/bin/sh

dependencies=(
    "sl" "trash" "screenfetch"
)

if [[ "$OSTYPE" == "darwin"* ]]
then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    for dep in ${dependencies[*]}; do
        echo "[Installing] => " $dep
        brew install $dep
    done
else
    sudo apt-get update && sudo apt-get upgrade
    for dep in ${dependencies[*]}; do
        echo "[Installing] => " $dep
        apt install $dep
    done
fi


