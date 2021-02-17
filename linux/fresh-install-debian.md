# Setting up Debian Based Distributions

This is a set of small scripts that I use to configure a new Debian based install.




## All Distros
Some basic packages and configurations I can't live without.

### Packages
```bash
sudo apt update
sudo apt upgrade
sudo apt install curl exfat-utils gcc git software-properties-common tmux tree vim
```

### Configuration Files
```bash
wget notes.ericdweise.com/dotfiles/gitconfig -O ~/.gitconfig
wget notes.ericdweise.com/dotfiles/vimrc -O ~/.vimrc
ssh-keygen -t rsa -b 4096 -f ~/.ssh/id_rsa
```






## Atom Text Editor
```bash
sudo apt install -y apt-transport-https
wget -qO - https://packagecloud.io/AtomEditor/atom/gpgkey | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packagecloud.io/AtomEditor/atom/any/ any main"

sudo apt update
sudo apt install -y atom

# Install Atom Packages
apm install mathjax-wrapper markdown-preview-plus language-markdown markdown-writer markdown-preview-enhanced
```





## Bluetooth
### Keyboard with NumLock stuck on
Do this if the bluetooth keyboard always connects with numlock on.
```bash
sudo apt install numlockx
echo '/usr/bin/numlockx off' | sudo tee -a /etc/X11/Xsession
```





## Docker and Docker Compose
1. Install prerequesite packages:

    ```bash
    sudo apt install -y \
        apt-transport-https \
        ca-certificates \
        curl \
        gnupg-agent \
        software-properties-common

    ```

2. Add docker's APT Key to your distro. There are different links depending on your distro. If you're on Ubuntu use this link

    ```bash
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
    ```
    If you're on Debian proper use this link:

    ```bash
    curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
    sudo apt-key fingerprint 0EBFCD88
    sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
    ```

3. Install Docker:

    ```bash
    sudo apt update
    sudo apt install -y \
        docker-ce \
        docker-ce-cli \
        containerd.io
    ```

4. Test installation:

    ```bash
    sudo docker run hello-world
    ```

5. Installing Docker Compose: https://docs.docker.com/compose/install/

    ```bash
    sudo curl -L "https://github.com/docker/compose/releases/download/1.25.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    sudo chmod +x /usr/local/bin/docker-compose
    ```

6. Add your user to the docker group so you don't need to run docker as sudo:

    ```bash
    sudo usermod -aG docker $USER
    exec su -l $USER
    docker run hello-world
    ```





## Password Manager
```bash
sudo apt-add-repository ppa:jtaylor/keepass -y
sudo apt update
sudo apt install -y keepass2
```





## Python 3
```bash
sudo apt install -y python3 python3-pip
sudo pip3 install virtualenv
```





## RSS Feed Reader
```bash
sudo add-apt-repository -y ppa:quiterss/quiterss
sudo apt update
sudo apt install -y quiterss
```





## Rust
```bash
sudo mkdir /opt/rust
sudo chown -R $(whoami) /opt/rust
RUSTUP_HOME=/opt/rust
export RUSTUP_HOME
CARGO_HOME=/opt/rust
export CARGO_HOME
curl https://sh.rustup.rs -sSf | sh -s -- -y --no-modify-path

for k in $(ls /opt/rust/bin); do
    f="/usr/local/bin/$k"
    echo '#!/bin/bash' | sudo tee $f
    echo 'RUSTUP_HOME=/opt/rust exec /opt/rust/bin/${0##*/} "$@"' | sudo tee -a $f
    sudo chmod +x $f
done

rustc --version
```





## Slack
Following instructions from [Linuxize](https://linuxize.com/post/how-to-install-slack-on-ubuntu-18-04/)

```bash
wget https://downloads.slack-edge.com/linux_releases/slack-desktop-4.0.2-amd64.deb
sudo apt install -y ./slack-desktop-*.deb
rm ./slack-desktop-*.deb
```





## Sudo (Debian Base Only)
```bash
su -c "apt upgrade -y && \
    apt install -y sudo && \
    echo \"Adding $USER to sudoers.\" && \
    usermod -aG sudo $USER"

logout    # Logout of root

echo "Re-login to user '$USER' to enable sudo access."
exec su -l $USER
```





## Virtual Box
Following instructions at the [Virtual Box website](https://www.virtualbox.org/wiki/Linux_Downloads)
```bash
sudo apt-add-repository https://download.virtualbox.org/virtualbox/debian

# Add Oracle Public Keys
wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -

# Install
sudo apt update
sudo apt install virtualbox
```

The first time you try to run `virtualbox` you might get an error asking you to reinstall linux headers.
The only thing I did that got rid of this message was to reboot the computer.






## Disable Snaps
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
