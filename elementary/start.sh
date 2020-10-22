#!/bin/sh

set -e
printf "## Install setup packages\n\n"

printf "\n## Installing Snap\n\n"

sudo apt update
sudo apt-get install snapd

export PATH=$PATH:/snap/bin

printf "\n## Using Snap Package Manager\n\n"

sudo snap install spotify
sudo snap install firefox
sudo snap install code --classic
sudo snap install insomnia
sudo snap install docker
sudo snap install gh --edge
sudo snap install node --classic

printf "\n## Installing PHP, Composer and Git\n\n"

sudo apt install php composer git

printf "\n## Installing Volta\n\n"

curl https://get.volta.sh | bash

printf "\n## Installing ZSH and  Oh My ZSH\n\n"

sudo apt-get install zsh
set +e
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
set -e

printf "\n## Installation finished successfully\n\n"
exit