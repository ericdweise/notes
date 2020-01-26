apt update
apt upgrade -y

curl https://sh.rustup.rs -sSf | sh

source $HOME/.cargo/env

apt install build-essential

rustc --version
