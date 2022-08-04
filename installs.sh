sudo pacman -Syu

sudo pacman -S --needed polybar alacritty rofi

yay -S --needed pulseaudio-control

# Comment the lines before the "Manage dotfiles" 
# if you don't want my personal packages that have nothing
# to do with my linux setup

sudo pacman -S --needed firefox code discord sagemath
sudo pacman -S --needed texlive-core texlive-science texlive-pictures

yay -S --needed rustup && rustup default stable

yay -S --needed sublime-text-4 obsidian

# Install rofi's theme
git clone https://github.com/lr-tech/rofi-themes-collection.git ~/rofi-themes-collection
cd rofi-themes-collection
mkdir -p ~/.local/share/rofi/themes/
cp themes/nord.rasi ~/.local/share/rofi/themes/nord.rasi



echo "Fixing discord's .desktop file"
sudo rm -f /usr/share/applications/discord.desktop
sudo cp discord.desktop /usr/share/applications/discord.desktop


# Make firefox the default browser
xdg-mime default firefox.desktop x-scheme-handler/http
xdg-mime default firefox.desktop scheme-handler/http
xdg-mime default firefox.desktop x-scheme-handler/https
xdg-mime default firefox.desktop scheme-handler/https

# Manage dotfiles

declare -a configs=("alacritty" "rofi" "polybar")

sudo rm -f -r ~/.i3
ln -s ~/dotfiles/i3 ~/.i3

for conf in "${configs[@]}"
do
    sudo rm -f -r ~/.config/$conf
    ln -s ~/dotfiles/$conf ~/.config/$conf
done

sudo code --install-extension teabyii.ayu

sudo rm -f ~/.config/Code\ -\ OSS/User/settings.json
ln -s ~/dotfiles/code/settings.json ~/.config/Code\ -\ OSS/User/settings.json
