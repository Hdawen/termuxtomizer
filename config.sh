#!/bin/bash
while getopts ":r" opt; do
	case $opt in
		r ) pkg remove zsh neofetch; rm -rf ~/.oh-my-zsh ~/.hushlogin ~/.zshrc ~/.termux; exit;;
		\? ) echo "Usage: runme.sh [-r]"; exit;;
	esac
done
dir=$(cd "$(dirname "$0")";pwd)
cp -r $dir/.termux ~
cp $dir/.hushlogin ~
pkg install zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
chsh -s zsh
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-completions ~/.oh-my-zsh/custom/plugins/zsh-completions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
cp $dir/.zshrc ~
read -p "Please enter custom text (eg. device name): " text
echo "POWERLEVEL9K_CUSTOM_TEXT=\"echo $text\"" >> ~/.zshrc
while true; do
	read -p "Would you like to have neofetch on startup (which may highly delay the start process)? [Y/n] " neo
	case $neo in
		[Yy] ) apt install neofetch; echo "neofetch" >> ~/.zshrc; break;;
		[Nn] ) break;;
		* ) echo "Invalid input... Try again.";;
	esac
done
echo "Done. Restart session to take effect."
