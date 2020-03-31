#!/bin/bash

#Options
while getopts ":r" opt; do
	case $opt in
		r)
			pkg remove zsh
			rm -rf ~/.oh-my-zsh ~/.hushlogin ~/.zshrc ~/.termux ~/.p10k.zsh
			chsh -s bash
			echo ""
			echo "Done. Restart session to take effect."
			exit
			;;
		\?)
			echo "Usage: runme.sh [-r]"
			exit
			;;
	esac
done


#Init
dir=$(cd "$(dirname "$0")"; pwd)
rc=~/.zshrc
touch ~/.hushlogin
mkdir ~/.termux
echo "extra-keys = [['ESC','/','-','HOME','UP','END','PGUP'],['TAB','CTRL','ALT','LEFT','DOWN','RIGHT','PGDN']]" > ~/.termux/termux.properties


#Zsh
pkg install git zsh
chsh -s zsh
sh -c "$(sed -e "/exec zsh -l/d" <<< $(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh))"
   

#Plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-completions ~/.oh-my-zsh/custom/plugins/zsh-completions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
git clone https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/custom/themes/powerlevel10k
sed -i "s/ZSH_THEME=\"robbyrussell\"/ZSH_THEME=\"powerlevel10k\/powerlevel10k\"/g" $rc
sed -i "s/plugins=(git)/plugins=(git zsh-autosuggestions zsh-completions zsh-syntax-highlighting)/g" $rc


#Fonts
url="https://raw.github.com/ryanoasis/nerd-fonts/master/patched-fonts"
echo ""
echo "Pick a font you like."
echo "1) Agave"
echo "2) Anoymous Pro"
echo "3) Arimo"
echo "4) BigBlue Terminal"
echo "5) Bitstream Vera Sans Mono"
echo "6) Cascadia Code"
echo "7) Cousine"
echo "8) DaddyTime Mono"
echo "9) DejaVu Sans Mono"
echo "10) Fantasque"
echo "11) Fira Code"
echo "12) Go Mono"
echo "13) Hack Mono"
echo "14) Heavy Data"
echo "15) iA Writer Mono"
echo "16) IBM Plex Mono"
echo "17) Inconsolata"
echo "18) Inconsolata Go"
echo "19) Inconsolata LGC"
echo "20) Iosevka"
echo "21) JetBrains Mono"
echo "22) Lekton"
echo "23) Liberation Mono"
echo "24) Monofur"
echo "25) Monoid"
echo "26) Mononoki"
echo "27) Noto"
echo "28) ProggyClean"
echo "29) Roboto Mono"
echo "30) Share Tech Mono"
echo "31) Space Mono"
echo "32) Terminus"
echo "33) Tinos"
echo "34) Ubuntu"
echo "35) Victor Mono"
echo ""
echo "Default is Noto."
while true; do
	read -p "Choice [1-35]: " font
	case $font in
		1)
			curl -L $url/Agave/complete/agave%20regular%20Nerd%20Font%20Complete%20Mono.ttf -o ~/.termux/font.ttf
			break
			;;
		2)
			curl -L $url/AnonymousPro/complete/Anonymice%20Nerd%20Font%20Complete%20Mono.ttf -o ~/.termux/font.ttf
			break
			;;
		3)
			curl -L $url/Arimo/Regular/complete/Arimo%20Regular%20Nerd%20Font%20Complete%20Mono.ttf -o ~/.termux/font.ttf
			break
			;;
		4)
			curl -L $url/BigBlueTerminal/complete/BigBlue%20TerminalPlus%20Nerd%20Font%20Complete%20Mono.TTF -o ~/.termux/font.ttf
			break
			;;
		5)
			curl -L $url/BitstreamVeraSansMono/Regular/complete/Bitstream%20Vera%20Sans%20Mono%20Nerd%20Font%20Complete%20Mono.ttf -o ~/.termux/font.ttf
			break
			;;
		6)
			curl -L $url/CascadiaCode/complete/Caskaydia%20Cove%20Nerd%20Font%20Complete%20Mono.ttf -o ~/.termux/font.ttf
			break
			;;
		7)
			curl -L $url/Cousine/Regular/complete/Cousine%20Regular%20Nerd%20Font%20Complete%20Mono.ttf -o ~/.termux/font.ttf
			break
			;;
		8)
			curl -L $url/DaddyTimeMono/complete/DaddyTimeMono%20Nerd%20Font%20Complete%20Mono.ttf -o ~/.termux/font.ttf
			break
			;;
		9)
			curl -L $url/DejaVuSansMono/Regular/complete/DejaVu%20Sans%20Mono%20Nerd%20Font%20Complete%20Mono.ttf -o ~/.termux/font.ttf
			break
			;;
		10)
			curl -L $url/FantasqueSansMono/Regular/complete/Fantasque%20Sans%20Mono%20Regular%20Nerd%20Font%20Complete%20Mono.ttf -o ~/.termux/font.ttf
			break
			;;
		11)
			curl -L $url/FiraCode/Regular/complete/Fira%20Code%20Regular%20Nerd%20Font%20Complete%20Mono.ttf -o ~/.termux/font.ttf
			break
			;;
		12)
			curl -L $url/Go-Mono/Regular/complete/Go%20Mono%20Nerd%20Font%20Complete%20Mono.ttf -o ~/.termux/font.ttf
			break
			;;
		13)
			curl -L $url/Hack/Regular/complete/Hack%20Regular%20Nerd%20Font%20Complete%20Mono.ttf -o ~/.termux/font.ttf
			break
			;;
		14)
			curl -L $url/HeavyData/complete/Heavy%20Data%20Nerd%20Font%20Complete%20Mono.ttf -o ~/.termux/font.ttf
			break
			;;
		15)
			curl -L $url/iA-Writer/iA%20Writer%20Mono/Regular/complete/iM%20Writing%20Mono%20S%20Regular%20Nerd%20Font%20Complete%20Mono.ttf -o ~/.termux/font.ttf
			break
			;;
		16)
			curl -L $url/IBMPlexMono/Mono/complete/Blex%20Mono%20Text%20Nerd%20Font%20Complete%20Mono.ttf -o ~/.termux/font.ttf
			break
			;;
		17)
			curl -L $url/Inconsolata/complete/Inconsolata%20Regular%20Nerd%20Font%20Complete%20Mono.ttf -o ~/.termux/font.ttf
			break
			;;
		18)
			curl -L $url/InconsolataGo/Regular/complete/InconsolataGo%20Nerd%20Font%20Complete%20Mono.ttf -o ~/.termux/font.ttf
			break
			;;
		19)
			curl -L $url/InconsolataLGC/Regular/complete/Inconsolata%20LGC%20Nerd%20Font%20Complete%20Mono.ttf -o ~/.termux/font.ttf
			break
			;;
		20)
			curl -L $url/Iosevka/Regular/complete/Iosevka%20Nerd%20Font%20Complete%20Mono.ttf -o ~/.termux/font.ttf
			break
			;;
		21)
			curl -L $url/JetBrainsMono/Regular/complete/JetBrains%20Mono%20Regular%20Nerd%20Font%20Complete%20Mono.ttf -o ~/.termux/font.ttf
			break
			;;
		22)
			curl -L $url/Lekton/Regular/complete/Lekton%20Nerd%20Font%20Complete%20Mono.ttf -o ~/.termux/font.ttf
			break
			;;
		23)
			curl -L $url/LiberationMono/complete/Literation%20Mono%20Nerd%20Font%20Complete%20Mono.ttf -o ~/.termux/font.ttf
			break
			;;
		24)
			curl -L $url/Monofur/Regular/complete/monofur%20Nerd%20Font%20Complete%20Mono.ttf -o ~/.termux/font.ttf
			break
			;;
		25)
			curl -L $url/Monoid/Regular/complete/Monoid%20Regular%20Nerd%20Font%20Complete%20Mono.ttf -o ~/.termux/font.ttf
			break
			;;
		26)
			curl -L $url/Mononoki/Regular/complete/mononoki-Regular%20Nerd%20Font%20Complete%20Mono.ttf -o ~/.termux/font.ttf
			break
			;;
		27)
			curl -L $url/Noto/Mono/complete/Noto%20Mono%20Nerd%20Font%20Complete%20Mono.ttf -o ~/.termux/font.ttf
			break
			;;
		28)
			curl -L $url/ProggyClean/Regular/complete/ProggyCleanTT%20Nerd%20Font%20Complete%20Mono.ttf -o ~/.termux/font.ttf
			break
			;;
		29)
			curl -L $url/RobotoMono/Regular/complete/Roboto%20Mono%20Nerd%20Font%20Complete%20Mono.ttf -o ~/.termux/font.ttf
			break
			;;
		30)
			curl -L $url/ShareTechMono/complete/Shure%20Tech%20Mono%20Nerd%20Font%20Complete%20Mono.ttf -o ~/.termux/font.ttf
			break
			;;
		31)
			curl -L $url/SpaceMono/Regular/complete/Space%20Mono%20Nerd%20Font%20Complete%20Mono.ttf -o ~/.termux/font.ttf
			break
			;;
		32)
			curl -L $url/Terminus/terminus-ttf-4.40.1/Regular/complete/Terminess%20%28TTF%29%20Nerd%20Font%20Complete%20Mono.ttf -o ~/.termux/font.ttf
			break
			;;
		33)
			curl -L $url/Tinos/Regular/complete/Tinos%20Nerd%20Font%20Complete%20Mono.ttf -o ~/.termux/font.ttf
			break
			;;
		34)
			curl -L $url/UbuntuMono/Regular/complete/Ubuntu%20Mono%20Nerd%20Font%20Complete%20Mono.ttf -o ~/.termux/font.ttf
			break
			;;
		35)
			curl -L $url/VictorMono/Regular/complete/Victor%20Mono%20Regular%20Nerd%20Font%20Complete%20Mono.ttf -o ~/.termux/font.ttf
			break
			;;
		"")
			echo "Using default value."
			curl -L $url/Noto/Mono/complete/Noto%20Mono%20Nerd%20Font%20Complete%20Mono.ttf -o ~/.termux/font.ttf
			break
			;;
	esac
done


#Color Schemes
git clone https://github.com/kdrag0n/base16-termux.git $dir/base16-termux
targets=$(grep -o -P "(?<=6-).*?(?=-2)" <<< $(ls $dir/base16-termux/colors))
array=($targets)
echo ""
echo "Pick a color scheme."

for ((i=0; i<${#array[@]}; i++))
do
        echo "$[i+1]) $(sed -e "s/\b\(.\)/\u\1/g" <<< $(sed -e "s/-/ /g"  <<< $(echo ${array[$i]})))"
done

echo ""
echo "Default is Solarized Dark."

while true
do
	read -p "Choice [1-$i]: " color
	if [ -z "$color" ]
	then
		echo "Using default value."
		sleep 1
		cp $dir/base16-termux/colors/base16-solarized-dark-256.properties ~/.termux/colors.properties
		break
	elif [ $color -ge 1 ] && [ $color -le $i ]
	then
		color=$[ $color - 1 ]
		cp $dir/base16-termux/colors/base16-${array[$color]}-256.properties ~/.termux/colors.properties
		break
	fi
done


#Neofetch
echo ""
echo "Run neofetch on startup?"
echo ""
echo "Default is No."

while true
do
	read -p "Choice [Y/n]: " neo
	case $neo in
		Y* | y*)
			apt install neofetch; echo "neofetch" >> $rc
			break
			;;
		N* | n*)
			break
			;;
		"")
			echo "Using default value."
			sleep 1
			break
			;;
	esac
done


#End
rm -rf $dir/base16-termux
echo ""
echo "Done. Restart session to take effect."

