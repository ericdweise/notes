# Install basic utilities for Ubuntu

apt-get update
apt-get -y upgrade

apt-get install -y \
    curl \
    exfat-utils \
    gcc \
    git \
    vim \
    zsh

git config --global user.name 'Eric Weise'
git config --global user.email 'ericdweise@gmail.com'

chsh -s $(which zsh)
