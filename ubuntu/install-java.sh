# Instructions taken from here:
# https://www.digitalocean.com/community/tutorials/how-to-install-java-with-apt-on-ubuntu-18-04

# This installs Java 9 on Ubuntu 18.04

apt update
apt upgrade -y

apt install -y default-jre

java -version
