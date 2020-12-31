
# Keepass
sudo pacman -Sy keepass

# Developer utils
sudo pacman -S binutils make gcc pkg-config fakeroot


# VS Code
cd /tmp
git clone https://aur.archlinux.org/visual-studio-code-bin.git
cd visual-studio-code-bin/
makepkg -si
