# Instruction for installing Docker

[Instructions taken from here.](https://docs.docker.com/install/linux/docker-ce/ubuntu/)

```bash
sudo apt-get update
 
# Install Docker
sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common
 
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
 
sudo add-apt-repository \
    "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) \
    stable"
 
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io
 
# Test Docker installation
sudo docker run hello-world
```
