# Install basic utilities for Ubuntu

apt-get update
apt-get -y upgrade

apt-get install -y \
    curl \
    exfat-utils \
    gcc \
    git \
    tmux \
    vim \
    zsh

chsh -s $(which zsh)
