# Devices

Some things I need to do repeatedly on the devices I own.
Most are linux things.



## Favorite Software

- [Managing My Audio Collection](audio)



## Acer Cloudbook

<details>
<summary>Show</summary>

### Computer
Acer Cloudbook 11
Year: 2015
Model No: N15V1
Debian 9 with XFCE desktop

### Installing Debian 9 on the Acer Cloudbook with eMMC storage.
1. Boot computer and get to the "Debian GNU/Linux installer boot loader"
2. Press `esc` key to get to the grub command-line
3. `install /install.amd/vmlinuz desktop=xfce vga=788 noapic edd=off quiet`
4. You will need to add the iwlwifi firmware. Can be found one of these places:
    * https://github.com/OpenELEC/iwlwifi-firmware/blob/master/firmware/iwlwifi-3160-17.ucode
    * https://packages.debian.org/sid/firmware-iwlwifi
5. Proceed with installation as you normally would

</details>




## Android

<details>
<summary>Show</summary>

### Transferring Files to Debian
1. `sudo apt install jmtpfs`
2. Debian only: `sudo apt install fusermount`
3. Connect android to computer (USB)
4. Enable `File Transfer` on phone
5. Make mount point: `mkdir ~/android`
6. Mount phone: `jmtpfs ~/android`
7. Move files
8. Unmount: `fusermount -u ~/android`

</details>




## Ubuntu

<details>
<summary>Show</summary>

### Making a PDF from Multiple Files:
I prefer `img2pdf` over `convert`.
It has a lower memory footprint and `convert` will crash on my cloudbook if there are more than 14 pages of 300 dpi pngs.
```bash
img2pdf -o output.pdf JPG1 [JPG2 [...]]
```

To install `img2pdf` on Debian: `sudo apt install img2pdf`


### Bluetooth Keyboard
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

1. Install the xubuntu-desktop metapackage:
    ```bash
    sudo apt install xubuntu-desktop
    ```

1. If you weren't prompted to change Desktop Managers to LightDM:
    ```bash
    sudo dpkg-reconfigure lightdm
    ```

1. Add or replace this stanza in the `~/.dmrc` file in your home folder:
    ```bash
    [Desktop]
    Session=xfce4
    ```

1. Reboot.

1. Optionally, you can get rid of the Unity/Gnome utilities:
    ```bash
    sudo apt-get purge libgnome* gnome-session* gnome-desktop* gnome-panel* gnome-user* gnome-shell* \
        gnome-applet* gnome-terminal* gnome-bluetooth gnome-system-tools gnome-software-plugin-snap \
        gnome-power-manager gnome-system-monitor gnome-control-center gnome-logs gnome-screensaver \
        gnome-themes* gnome-accessibility-themes gnome-menus gnome-screenshot overlay-scrollba* hud \
        unity* compiz* zeitgeist* libzeitgeist* activity-log-manager-common nautilus
    sudo apt autoremove
    ```

</details>
