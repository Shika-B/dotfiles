sudo pacman -Syu

sudo pacman -S --needed polybar alacritty rofi

yay -S --needed pulseaudio-control

# Comment the lines before the "Manage dotfiles" 
# if you don't want my personal packages that have nothing
# to do with my linux setup

sudo pacman -S --needed firefox code discord sagemath
sudo pacman -S texlive-core texlive-science texlive-pictures

yay -S --needed rustup && rustup default stable

yay -S -needed sublime-text-4 obsidian


echo "Fixing discord's .desktop file"
cat discord.desktop > /usr/share/applications/discord.desktop


# Manage dotfiles

declare -a configs=("alacritty" "rofi" "polybar")

rm -r ~/.i3
ln -s ~/dotfiles/i3 ~/.i3

for conf in "${configs[@]}"
do
	if [-d ~/.config/$conf]; then
		rm -r ~/.config/$conf
	fi
	ln -s ~/dotfiles/$conf ~/.config/$conf
done

code --install-extension teabyii.ayu

rm -r ~/.config/Code\ -\ OSS/User/settings.json
ln -s ~/dotfiles/$conf ~/.config/Code\ -\ OSS/User/settings.json