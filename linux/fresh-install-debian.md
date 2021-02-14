# Setting up Debian Based Distributions

This is a set of small scripts that I use to configure a new Debian based install.

## Install Steps

|                        | Debian (Base) | Personal Computer | Development Computer | Kali Pen Test Computer |
|------------------------|---------------|-------------------|----------------------|------------------------|
| All Distros            |               |                   |                      |                        |
| Atom Text Editor       |               |                   |                      |                        |
| Docker                 |               |                   |                      |                        |
| Password Manager       |               |                   |                      |                        |
| Python 3               |               |                   |                      |                        |
| RSS Feed Reader        |               |                   |                      |                        |
| Rust                   |               |                   |                      |                        |
| Slack                  |               |                   |                      |                        |
| Sudo                   |               |                   |                      |                        |
| Virtual Box            |               |                   |                      |                        |
 
 
 
 
 
 
 
 





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

# Install Atop Packages
apm install mathjax-wrapper markdown-preview-plus language-markdown markdown-writer markdown-preview-enhanced
```






## Docker and Docker Compose
```bash
sudo apt install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

if [ $DISTRO == 'ubuntu' ]; then
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    sudo add-apt-repository \
        "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
elif [ $DISTRO == 'debian' ]; then
    curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
    sudo apt-key fingerprint 0EBFCD88
    sudo add-apt-repository \
        "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
fi

sudo apt update
sudo apt install -y \
    docker-ce \
    docker-ce-cli \
    containerd.io

# Test installation
sudo docker run hello-world

# Installing Docker Compose: https://docs.docker.com/compose/install/
sudo curl -L "https://github.com/docker/compose/releases/download/1.25.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
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
USER_NAME=$(whoami)
su -c "apt upgrade -y && \
    apt install -y sudo && \
    echo \"Adding $USER_NAME to sudoers.\" && \
    usermod -aG sudo $USER_NAME"

logout

echo "Re-login to user '$USER_NAME' to allow sudo access."
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
