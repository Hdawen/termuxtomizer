#!/bin/bash

while getopts ":r" opt; do
    case $opt in
        r ) rm -rf ~/oh-my-zsh ~/.hushlogin ~/.zshrc ~/.termux; pkg remove zsh neofetch;;
        \? ) echo "Usage: runme.sh [-r]"
    esac
done

dir=$(cd "$(dirname "$0")";pwd)
cp -r $dir/.termux ~
cp $dir/.hushlogin ~
pkg install zsh neofetch
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
chsh -s zsh

while true; do
    read -p "Powerlevel9k or Powerlevel10k? [A/B]" input
    case $input in
        [Aa] ) git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k; break;;
        [Bb] ) git clone https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/custom/themes/powerlevel10k; break;;
        * ) echo "Invalid input... Try again.";;
    esac
done

git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-completions ~/.oh-my-zsh/custom/plugins/zsh-completions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
cp $dir/.zshrc ~
echo "Done."
