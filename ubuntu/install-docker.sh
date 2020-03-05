# Following steps outlined here:
#   https://docs.docker.com/install/linux/docker-ce/ubuntu/
# 
# Requires sudo

apt update
apt upgrade -y

apt install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
add-apt-repository \
    "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

apt update
apt install -y \
    docker-ce \
    docker-ce-cli \
    containerd.io

systemctl status docker
docker run hello-world


## Installing Docker Compose
# Following these instructions:
#   https://docs.docker.com/compose/install/
sudo curl -L "https://github.com/docker/compose/releases/download/1.25.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
