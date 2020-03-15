# Configuring a new Debian instance


# Set up sudo for current user
USER_NAME=$(whoami)

echo 'Switching to Super User to add current user to sudo group.'
su
apt update && apt upgrade -y
apt install sudo
usermod -aG $USER_NAME sudo
# TODO: Make sure script exits safely (decreases privilege) if this execution block fails somehow
exit

sudo ./ubuntu/install-basic-packages.sh


# Configure GIT
git config --global user.name 'Eric Weise'
git config --global user.email 'ericdweise@gmail.com'
