sudo pacman -S --needed polybar alacritty rofi
yay -S --needed pulseaudio-control

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
