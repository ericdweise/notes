# Debian and Related Flavors

A collection of snipets that make using Debian easier.


## After a Fresh Install
Download and run the [bootstrap script](files/bootstrap-debian.sh).
Run `./bootstrap-debian.sh -h` for usage.


## Disabling Snaps
```bash
# Remove existing snaps
for SNAPPLE in $(snap list | tail -n +2 | cut -d ' ' -f 1); do
    echo "  Removing snap: $SNAPPLE"
    sudo snap remove $SNAPPLE
done

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


## Install Java
### Java 9
Tested on 18.04
```bash
apt update
apt upgrade -y

apt install -y default-jre

java -version
```
