#!/bin/bash

# Configuring a new Debian-based instance
# RUN AS UNPRIVILEGED USER. Don't use sudo
# This will also work on Ubuntu distros.


### FUNCTION DEFINITIONS ###

function announce {
    if [ $1 == 'install' ]; then
        printf "\n\n    <<< INSTALLING -- $2 >>>\n"

    elif [ $1 == 'config' ]; then
        printf "\n\n    <<< CONFIGURING -- $2 >>>\n"

    elif [ $1 == 'error' ]; then
        printf "\n\n    !!! ERROR: $2 !!!\n"
        exit

    else
        printf "\n\n    !!! ERROR: unknown announcement '$2' !!!\n"
        exit
    fi
}

function fresh_install {
    # The absolutely necessary packages for a fresh install of Debian/Ubuntu

    sudo apt install -y \
        curl \
        exfat-utils \
        gcc \
        git \
        tmux \
        tree \
        vim

    announce 'config' 'GIT'
    git config --global user.name 'Eric Weise'
    git config --global user.email 'ericdweise@gmail.com'

    announce 'config' 'SSH Keys'
    ssh-keygen -t rsa -b 4096 -f ~/.ssh/id_rsa
    }

function install_atom_text {
    announce 'install' "Atom Text Editor"

    #sudo apt install apt-transport-https
    #wget -qO - https://packagecloud.io/AtomEditor/atom/gpgkey | sudo apt-key add -
    #sh -c 'echo "deb [arch=amd64] https://packagecloud.io/AtomEditor/atom/any/ any main" > /etc/apt/sources.list.d/atom.list'

    #sudo apt update
    #sudo apt install -y atom
    }

function install_docker {
    # Following steps outlined here:
    #   https://docs.docker.com/install/linux/docker-ce/ubuntu/

    announce 'install' 'Docker and DockerCompose'

    sudo apt install -y \
        apt-transport-https \
        ca-certificates \
        curl \
        gnupg-agent \
        software-properties-common

    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    sudo add-apt-repository \
        "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

    sudo apt update
    sudo apt install -y \
        docker-ce \
        docker-ce-cli \
        containerd.io

    systemctl status docker
    sudo docker run hello-world

    ## Installing Docker Compose
    # Following these instructions:
    #   https://docs.docker.com/compose/install/
    sudo curl -L "https://github.com/docker/compose/releases/download/1.25.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    sudo chmod +x /usr/local/bin/docker-compose
    }

function install_music_tools {
    announce 'install' 'Strawberry (music library)'
    wget -O /tmp/strawberry.deb 'https://github.com/strawberrymusicplayer/strawberry/releases/download/0.6.11/strawberry_0.6.11-eoan_amd64.deb'
    sudo dpkg -i /tmp/strawberry.deb
    sudo apt-get install -yf
    sudo dpkg -i /tmp/strawberry.deb
    rm /tmp/strawberry.deb
    echo 'When moving files to collection use this format: %artist/{%album/}{%track_}%title.%extension'

    announce 'install' 'Audacious (music player)'
    sudo apt install -y audacious
    }

function install_password_manager {
    announce 'install' 'KeePass'

    sudo apt-add-repository ppa:jtaylor/keepass -y
    sudo apt update
    sudo apt install -y keepass2
    }

function install_python {
    announce 'install' 'Python 3'

    sudo apt install -y python3 python3-pip
    sudo pip install virtualenv
    }

function install_rss_client {
    # https://quiterss.org/

    announce 'install' 'QuiteRSS'

    sudo add-apt-repository -y ppa:quiterss/quiterss
    sudo apt update
    sudo apt install -y quiterss
    }

function install_rust_lang {
    announce 'install' 'Rust Language'

    curl https://sh.rustup.rs -sSf | sh
    source $HOME/.cargo/env
    sudo apt install build-essential

    rustc --version
    }

function install_slack {
    # https://linuxize.com/post/how-to-install-slack-on-ubuntu-18-04/

    announce 'install' 'Slack Messenger'

    # TODO: Automatically find latest file version
    wget https://downloads.slack-edge.com/linux_releases/slack-desktop-4.0.2-amd64.deb
    sudo apt install -y ./slack-desktop-*.deb
    rm ./slack-desktop-*.deb
    }

function install_sudo {
    if [ $(which sudo) ]; then
        echo "  Sudo is already installed."
        exit
    fi

    USER_NAME=$(whoami)

    echo "Temporarily switching to Super User"
    su

    announce 'install' 'sudo'
    apt update
    apt upgrade -y
    apt install sudo

    echo "Adding $USER_NAME to sudoers."
    usermod -aG $USER_NAME sudo

    # TODO: Make sure function exits safely (decreases privilege) if this execution block fails somehow
    exit
    }


############
### MAIN ###
############

# Install the sudo package on basic Debian distro
if [[ "$(uname -v)" == *"Debian"* ]]; then
    install_sudo
fi

# Handle Command Line Arguments
if ! [ "$@" ]; then
    echo 'Use "-h" to see arguments'
    return 0
fi

for ARG in "$@"; do
    if [ $ARG == '--fresh-install' ]; then
        FLAG_FRESH_INSTALL='1'
    elif [ $ARG == '--atom' ]; then
        FLAG_INSTALL_ATOM='1'
    elif [ $ARG == '--docker' ]; then
        FLAG_INSTALL_DOCKER='1'
    elif [ $ARG == '--music-tools' ]; then
        FLAG_INSTALL_MUSIC_TOOLS='1'
    elif [ $ARG == '--password-manager' ]; then
        FLAG_INSTALL_PASSWORD_MANAGER='1'
    elif [ $ARG == '--python' ]; then
        FLAG_INSTALL_PYTHON='1'
    elif [ $ARG == '--rss-client' ]; then
        FLAG_INSTALL_RSS_CLIENT='1'
    elif [ $ARG == '--rust' ]; then
        FLAG_INSTALL_RUST='1'
    elif [ $ARG == '--slack' ]; then
        FLAG_INSTALL_SLACK='1'
    elif [ $ARG == '-h' ]; then
        printf "Allowed arguments:
          --fresh-install
          --atom
          --docker
          --music-tools
          --password-manager
          --python
          --rss-client
          --rust
          --slack\n"
        return 0
    else
        announce 'error' "Unknown argument '$ARG'"
    fi
done

# Update aptitude and upgrade installed packages
echo '    <<< Updating Aptitude library and upgrading installed packages >>>'
sudo apt update
sudo apt upgrade -y

# INSTALL PACKAGES
if [ $FLAG_FRESH_INSTALL ]; then i
    fresh_install
    unset FLAG_FRESH_INSTALL
fi

if [ $FLAG_INSTALL_ATOM ]; then
    install_atom_text;
    unset FLAG_INSTALL_ATOM
fi

if [ $FLAG_INSTALL_DOCKER ]; then
    install_docker
    unset FLAG_INSTALL_DOCKER
fi

if [ $FLAG_INSTALL_MUSIC_TOOLS ]; then
    install_music_tools
    unset FLAG_INSTALL_MUSIC_TOOLS 
fi

if [ $FLAG_INSTALL_PASSWORD_MANAGER ]; then
    install_password_manager
    unset FLAG_INSTALL_PASSWORD_MANAGER
fi

if [ $FLAG_INSTALL_PYTHON ]; then
    install_python
    unset FLAG_INSTALL_PYTHON
fi

if [ $FLAG_INSTALL_RSS_CLIENT ]; then
    install_rss_client
    unset FLAG_INSTALL_RSS_CLIENT
fi

if [ $FLAG_INSTALL_RUST ]; then
    install_rust_lang
    unset FLAG_INSTALL_RUST
fi

if [ $FLAG_INSTALL_SLACK ]; then
    install_slack
    unset FLAG_INSTALL_SLACK
fi
