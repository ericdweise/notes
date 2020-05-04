# Imitating Kevin Custer's post:
#    https://www.kevin-custer.com/blog/disabling-snaps-in-ubuntu-20-04/


# Remove existing snaps
# TODO
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
