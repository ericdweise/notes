# Linux

Commands, heuristics, and tips for navigating Linux.


## Networking


## Filesystem


## APT Package Manager
APT is the package manager that comes with Debian (and Debian based flavor) distros.

### Sources
APT stores a list of source databases in `/etc/apt/sources.list` and `/etc/apt/sources.list.d/`.
TODO: Add a description of file format.

### Updating packages
```bash
sudo apt update  # update APT's database of available packages and versions
sudo apt upgrade # install newer version of packages already on machine
```

### PPAs
Adding a PPA:
```bash
sudo add-apt-repository --remove ppa:PPA_REPOSITORY_NAME/PPA
```
Removing a PPA:
```bash
sudo add-apt-repository ppa:PPA_REPOSITORY_NAME/PPA
```


## Personalization
My personal steps for setting up a linux computer.

### Install Favorite Programs (Debian)
Download and run the [bootstrap script](storage/bootstrap-debian.sh).
Run `./bootstrap-debian.sh -h` for usage.


### Copy DotFiles
You know what to do...


### Disabling Snaps
```bash
# Remove existing snaps
for SNAPPLE in $(snap list | tail -n +2 | cut -d ' ' -f 1); do
    echo "  Removing snap: $SNAPPLE"
    sudo snap remove $SNAPPLE
done
sudo snap remove core18
sudo snap remove snapd

# Get Snap Device ID
for SNAP_DEVICE in $(df --output=target | grep '/snap/' ); do
    echo "  Unmounting snap: $SNAP_DEVICE"
    sudo umount $SNAP_DEVICE
done

# Purge Aptitude package
sudo apt purge snapd

# Remove remaining Snap directories
rm -rf ~/snap
sudo rm -rf /snap
sudo rm -rf /var/snap
sudo rm -rf /var/lib/snapd
```

### Installing LightDM and XFCE
Ubuntu and Gnome come with quite a bit of fancy features that really slow it down.
I prefer a simpler and lighter interface, like XFCE.

1. Install LightDM:
    ```bash
    sudo apt install lightdm
    ```
1. Set LightDM as the default Display Manager:
    ```bash
    which lightdm | sudo tee /etc/X11/default-display-manager
    ```
1. Install the XFCE Meta Package:
    ```bash
    sudo apt install xfce4
    ```
1. Log out and log back in.
