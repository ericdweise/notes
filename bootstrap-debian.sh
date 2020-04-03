#!/bin/bash

# Configuring a new Debian instance
# RUN AS UNPRIVILEGED USER. Don't use sudo
# This will also work on Ubuntu distros.


### FUNCTION DEFINITIONS ###

function install_sudo {
    USER_NAME=$(whoami)

    echo "Switching to Super User."
    su

    echo "Installing 'sudo' package."
    apt update && apt upgrade -y
    apt install sudo

    echo "Adding $USER_NAME to sudoers."
    usermod -aG $USER_NAME sudo

    # TODO: Make sure function exits safely (decreases privilege) if this execution block fails somehow
    exit
}


### MAIN ###

if [[ "$(uname -v)" == *"Debian"* ]]; then
    install_sudo
fi


sudo ./ubuntu/install-basic-packages.sh


# Configure GIT
git config --global user.name 'Eric Weise'
git config --global user.email 'ericdweise@gmail.com'


# Create new RSA key
ssh-keygen -t rsa -b 4096 -f ~/.ssh/id_rsa


# Install KeePass
sudo ./ubuntu/install-keepass.sh
