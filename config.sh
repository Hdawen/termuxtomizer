#!/bin/bash

#Options
while getopts ":r" opt; do
	case $opt in
		r)
			pkg remove zsh neofetch
			rm -rf ~/.oh-my-zsh ~/.hushlogin ~/.zshrc ~/.termux ~/.p10k.zsh
			chsh -s bash
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


#Dependencies
pkg install git zsh
chsh -s zsh
sh -c $(sed -e "/exec zsh -l/d" <<< $(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh))
   

#Plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-completions ~/.oh-my-zsh/custom/plugins/zsh-completions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
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
echo "15) IBM Plex Mono"
echo "16) Inconsolata"
echo "17) Inconsolata Go"
echo "18) Inconsolata LGC"
echo "19) Iosevka"
echo "20) JetBrains Mono"
echo "21) Lekton"
echo "22) Liberation Mono"
echo "23) Monofur"
echo "24) Monoid"
echo "25) Mononoki"
echo "26) Noto"
echo "27) ProggyClean"
echo "28) Roboto Mono"
echo "29) Share Tech Mono"
echo "30) Space Mono"
echo "31) Terminus"
echo "32) Tinos"
echo "33) Ubuntu"
echo "34) Ubuntu Mono"
echo "35) Victor Mono"
echo "36) iA Writer Mono"
echo ""
echo "Default is Noto."
while true; do
	read -p "Choice [1-36]: " font
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
			curl -L $url/IBMPlexMono/Mono/complete/Blex%20Mono%20Text%20Nerd%20Font%20Complete%20Mono.ttf -o ~/.termux/font.ttf
			break
			;;
		16)
			curl -L $url/Inconsolata/complete/Inconsolata%20Regular%20Nerd%20Font%20Complete%20Mono.ttf -o ~/.termux/font.ttf
			break
			;;
		17)
			curl -L $url/InconsolataGo/Regular/complete/InconsolataGo%20Nerd%20Font%20Complete%20Mono.ttf -o ~/.termux/font.ttf
			break
			;;
		18)
			curl -L $url/InconsolataLGC/Regular/complete/Inconsolata%20LGC%20Nerd%20Font%20Complete%20Mono.ttf -o ~/.termux/font.ttf
			break
			;;
		19)
			curl -L $url/Iosevka/Regular/complete/Iosevka%20Nerd%20Font%20Complete%20Mono.ttf -o ~/.termux/font.ttf
			break
			;;
		20)
			curl -L $url/JetBrainsMono/Regular/complete/JetBrains%20Mono%20Regular%20Nerd%20Font%20Complete%20Mono.ttf -o ~/.termux/font.ttf
			break
			;;
		21)
			curl -L $url/Lekton/Regular/complete/Lekton%20Nerd%20Font%20Complete%20Mono.ttf -o ~/.termux/font.ttf
			break
			;;
		22)
			curl -L $url/LiberationMono/complete/Literation%20Mono%20Nerd%20Font%20Complete%20Mono.ttf -o ~/.termux/font.ttf
			break
			;;
		23)
			curl -L $url/Monofur/Regular/complete/monofur%20Nerd%20Font%20Complete%20Mono.ttf -o ~/.termux/font.ttf
			break
			;;
		24)
			curl -L $url/Monoid/Regular/complete/Monoid%20Regular%20Nerd%20Font%20Complete%20Mono.ttf -o ~/.termux/font.ttf
			break
			;;
		25)
			curl -L $url/Mononoki/Regular/complete/mononoki-Regular%20Nerd%20Font%20Complete%20Mono.ttf -o ~/.termux/font.ttf
			break
			;;
		26)
			curl -L $url/Noto/Mono/complete/Noto%20Mono%20Nerd%20Font%20Complete%20Mono.ttf -o ~/.termux/font.ttf
			break
			;;
		27)
			curl -L $url/ProggyClean/Regular/complete/ProggyCleanTT%20Nerd%20Font%20Complete%20Mono.ttf -o ~/.termux/font.ttf
			break
			;;
		28)
			curl -L $url/RobotoMono/Regular/complete/Roboto%20Mono%20Nerd%20Font%20Complete%20Mono.ttf -o ~/.termux/font.ttf
			break
			;;
		29)
			curl -L $url/ShareTechMono/complete/Shure%20Tech%20Mono%20Nerd%20Font%20Complete%20Mono.ttf -o ~/.termux/font.ttf
			break
			;;
		30)
			curl -L $url/SpaceMono/Regular/complete/Space%20Mono%20Nerd%20Font%20Complete%20Mono.ttf -o ~/.termux/font.ttf
			break
			;;
		31)
			curl -L $url/Terminus/terminus-ttf-4.40.1/Regular/complete/Terminess%20%28TTF%29%20Nerd%20Font%20Complete%20Mono.ttf -o ~/.termux/font.ttf
			break
			;;
		32)
			curl -L $url/Tinos/Regular/complete/Tinos%20Nerd%20Font%20Complete%20Mono.ttf -o ~/.termux/font.ttf
			break
			;;
		33)
			curl -L $url/Ubuntu/Regular/complete/Ubuntu%20Nerd%20Font%20Complete%20Mono.ttf -o ~/.termux/font.ttf
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
		36)
			curl -L $url/iA-Writer/iA%20Writer%20Mono/Regular/complete/iM%20Writing%20Mono%20S%20Regular%20Nerd%20Font%20Complete%20Mono.ttf -o ~/.termux/font.ttf
			break
			;;
		"")
			echo "Using default value."
			curl -L $url/Noto/Mono/complete/Noto%20Mono%20Nerd%20Font%20Complete%20Mono.ttf -o ~/.termux/font.ttf
			break
			;;
	esac
done


#Themes
echo ""
echo "Pick a theme."
echo "1) Powerlevel9k"
echo "2) Powerlevel10k"
echo ""
echo "Default is Powerlevel10k."

while true
do
	read -p "Choice [1-2]: " theme
	case $theme in
		[12])
			break
			;;
		"")
			echo "Using default value."
			theme="2"
			sleep 1
			break
			;;
	esac
done

if [ $theme -eq 1 ]
then
	git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
	sed -i "s/ZSH_THEME=\"robbyrussell\"/ZSH_THEME=\"powerlevel9k\/powerlevel9k\"/g" $rc

	echo ""
	echo "Enable double-line prompt?"
	echo ""
	read -p "Choice [Y/n]: " dual

	while true
	do
		case $dual in
			Y* | y* | "")
				echo "POWERLEVEL9K_PROMPT_ON_NEWLINE=true" >> $rc
				echo "POWERLEVEL9K_RPROMPT_ON_NEWLINE=true" >> $rc
				break
				;;
			N* | n*)
				break
				;;
		esac
	done

	echo ""
	echo "Hide the right prompt?"
	echo ""
	read -p "Choice [Y/n]: " prompt

	while true
	do
		case $prompt in
			Y* | y*)
				echo "POWERLEVEL9K_DISABLE_RPROMPT=true" >> $rc
				break
				;;
			N* | n* | "")
				break
				;;
		esac
	done

	echo ""
	read -p "Enter the custom text (eg. device name): " text
	echo "POWERLEVEL9K_CUSTOM_TEXT=\"echo $text\"" >> $rc
	echo "POWERLEVEL9K_CUSTOM_TEXT_BACKGROUND=000" >> $rc
	echo "POWERLEVEL9K_CUSTOM_TEXT_FOREGROUND=003" >> $rc
	echo "POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(custom_text dir vcs)" >> $rc
else
	git clone https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/custom/themes/powerlevel10k
	sed -i "s/ZSH_THEME=\"robbyrussell\"/ZSH_THEME=\"powerlevel10k\/powerlevel10k\"/g" $rc
fi


#Palettes
git clone https://github.com/kdrag0n/base16-termux.git $dir/base16-termux
targets=$(grep -o -P "(?<=6-).*?(?=-2)" <<< $(ls $dir/base16-termux/colors))
array=($targets)
echo ""
echo "Pick a color palette."

for ((i=0; i<${#array[@]}; i++))
do
        echo "$[i+1]) $(sed -e "s/\b\(.\)/\u\1/g" <<< $(sed -e "s/-/ /g"  <<< $(echo ${array[$i]})))"
done

echo ""
echo "Default is Solarized Dark."

while true
do
	read -p "Choice [1-$i]: " palette
	if [ -z "$palette" ]
	then
		echo "Using default value."
		sleep 1
		cp $dir/base16-termux/colors/base16-solarized-dark-256.properties ~/.termux/colors.properties
		break
	elif [ $palette -ge 1 ] && [ $palette -le $i ]
	then
		palette=$[ $palette - 1 ]
		cp $dir/base16-termux/colors/base16-${array[$palette]}-256.properties ~/.termux/colors.properties
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

