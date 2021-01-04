
# Keepass
sudo pacman -Sy keepass

# Developer utils
sudo pacman -S binutils make gcc pkg-config fakeroot


# VS Code
cd /tmp
git clone https://aur.archlinux.org/visual-studio-code-bin.git
cd visual-studio-code-bin/
makepkg -si


# CalCurse (calendar)
sudo pacman -Ss calcurse

CAL_DIR="$HOME/mobilehome/documents/calendar"
if ! [ -d $CAL_DIR ]; then
    mkdir -p $CAL_DIR
fi

echo "alias calcurse='calcurse --confdir $CAL_DIR --datadir $CAL_DIR'" >> "$HOME/.bashrc"
