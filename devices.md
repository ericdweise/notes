# Device Quirks

## Instructions for installing Debian 9 on the Acer Cloudbook with eMMC storage.
1. Boot computer and get to the "Debian GNU/Linux installer boot loader"
2. Press `esc` key to get to the grub command-line
3. `install /install.amd/vmlinuz desktop=xfce vga=788 noapic edd=off quiet`
4. You will need to add the iwlwifi firmware. Can be found one of these places:
    * https://github.com/OpenELEC/iwlwifi-firmware/blob/master/firmware/iwlwifi-3160-17.ucode
    * https://packages.debian.org/sid/firmware-iwlwifi
5. Proceed with installation as you normally would

### Computer Specs
Acer Cloudbook 11
Year: 2015
Model No: N15V1
Debian 9 with XFCE desktop


## Bluetooth Keyboard
Boot up with numlock disabled:
```bash
sudo apt install -y numlockx
IS_ERROR=0
if [ ! -f /usr/bin/numlockx ]; then
    echo 'ERROR: numlockx not installed'
    IS_ERROR=1
fi

if [ ! -f /etc/X11/Xsession ]; then
    echo 'ERROR: config file not found'
    IS_ERROR=1
fi

if [ $IS_ERROR = 0 ]; then 
    echo '/usr/bin/numlockx off' | sudo tee -a /etc/X11/Xsession
fi
```

## Installing LightDM and XFCE on Ubuntu
```bash
sudo apt install xubuntu-desktop
```
then, log out and log back in.

Optionally, you can get rid of the Unity/Gnome utilities:
```bash
sudo apt purge nautilus gnome-power-manager gnome-screensaver gnome-termina* \
    gnome-pane* gnome-applet* gnome-bluetooth gnome-desktop* gnome-sessio* \
    gnome-user* gnome-shell-common compiz compiz* unity unity* hud zeitgeist \
    zeitgeist* python-zeitgeist libzeitgeist* activity-log-manager-common \
    gnome-control-center gnome-screenshot overlay-scrollba* 
sudo apt autoremove
```
