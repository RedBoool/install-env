#!/bin/bash

GREEN='\032[0;31m'
RED='\033[0;31m'
NC='\033[0m' # No Color

## Generate SSH key
echo '${GREEN}###Installing Git..${NC}'
read SSHEMAIL;
ssh-keygen -t ed25519 -C "${SSHEMAIL}"

## Git ##
echo '${GREEN}###Installing Git..${NC}'
sudo apt-get install git -y

# Git Configuration
echo '${GREEN}###Congigure Git..${NC}'

echo "Enter the Global Username for Git:";
read GITUSER;
git config --global user.name "${GITUSER}"

echo "Enter the Global Email for Git:";
read GITEMAIL;
git config --global user.email "${GITEMAIL}"

echo 'Git has been configured!'
git config --list

## Shell (ZSH + oh-my-zsh + Powerlevel10k) ##
echo '${GREEN}###Installing Zsh..${NC}'
sudo apt install zsh

echo '${GREEN}###Installing oh-my-zsh..${NC}'
git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh
cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
sed -i 's/plugins=(git)/plugins=(git sudo)/g' ~/.zshrc
chsh -s $(which zsh)

echo '${GREEN}###Installing PowerLevel10k..${NC}'
sudo mkdir /usr/local/share/fonts/hack
sudo wget -O /usr/local/share/fonts/hack/hack.zip https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Hack.zip
sudo unzip -d /usr/local/share/fonts/hack /usr/local/share/fonts/hack/hack.zip
sudo rm /usr/local/share/fonts/hack/hack.zip

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="powerlevel10k\/powerlevel10k"/g' ~/.zshrc
