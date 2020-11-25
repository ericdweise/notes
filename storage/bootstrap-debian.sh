#!/bin/bash

# Configuring a new Debian-based instance
# RUN AS UNPRIVILEGED USER. Don't use sudo
# This will also work on Ubuntu distros.
set -e


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

function get_distro {
    if [[ "$(uname -v)" == *"Debian"* ]]; then
        DISTRO='debian'
    elif [[ "$(uname -v)" == *"Ubuntu"* ]]; then
        DISTRO='ubuntu'
    fi
}


function fresh_install {
    # My absolutely necessary packages for a fresh install of Debian/Ubuntu

    if [ $DISTRO == 'debian' ]; then
        if ! [ $(which sudo) ]; then
            install_sudo
        fi
    fi

    sudo apt update
    sudo apt upgrade -y

    sudo apt install -y \
        curl \
        exfat-utils \
        gcc \
        git \
        tmux \
        tree \
        vim

    announce 'config' 'GIT'
    cp ../dotfiles/.gitconfig ~

    announce 'config' 'SSH Keys'
    ssh-keygen -t rsa -b 4096 -f ~/.ssh/id_rsa
    }

function install_atom_text {
    announce 'install' "Atom Text Editor"

    sudo apt install -y apt-transport-https
    wget -qO - https://packagecloud.io/AtomEditor/atom/gpgkey | sudo apt-key add -
    sudo add-apt-repository "deb [arch=amd64] https://packagecloud.io/AtomEditor/atom/any/ any main"

    sudo apt update
    sudo apt install -y atom

    # Install Atop Packages
    apm install mathjax-wrapper markdown-preview-plus language-markdown markdown-writer markdown-preview-enhanced
    }

function install_calendar {
    # https://www.calcurse.org/
    announce 'install' 'Calendar: CalCurse'
    sudo apt install -y calcurse

    if ! mountpoint -q "$HOME/mobilehome"; then
        echo "MobileHome is not mounted, configuration failed for Calcurse Calendar"
        exit 1
    fi

    CAL_DIR="$HOME/mobilehome/documents/calendar"
    if ! [ -d $CAL_DIR ]; then
        mkdir -p $CAL_DIR
    fi

    echo "alias calcurse='calcurse --confdir $CAL_DIR --datadir $CAL_DIR" >> "$HOME/.bashrc"

    # OSMO Calendar
    # announce 'install' 'OSMO Calendar'
    # sudo apt install -y osmo

    # https://dmedvinsky.github.io/gsimplecal/
}

function install_dev_tools {
    announce 'install' 'Development Tools'
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
    sudo apt install -y /tmp/strawberry.deb
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
    sudo pip3 install virtualenv
    }

function install_rss_client {
    # https://quiterss.org/

    announce 'install' 'QuiteRSS'

    sudo add-apt-repository -y ppa:quiterss/quiterss
    sudo apt update
    sudo apt install -y quiterss
    }

function install_rust_lang {
    if [ $(which cargo) ]; then
        return 0
    fi

    announce 'install' 'Rust Language'

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
    USER_NAME=$(whoami)

    apt update

    echo "Temporarily switching to Super User"
    su -c "apt upgrade -y && \
        apt install -y sudo && \
        echo \"Adding $USER_NAME to sudoers.\" && \
        usermod -aG sudo $USER_NAME"

    # TODO: Make sure function exits safely (decreases privilege) if this execution block fails somehow
    logout

    echo "Re-login to user '$USER_NAME' to allow sudo access."
    exec su -l $USER
    }


############
### MAIN ###
############

# Handle Command Line Arguments
if [ "$#" -lt 1 ]; then
    echo 'Use "-h" to see arguments'
    exit 0
fi

for ARG in "$@"; do
    if [ $ARG == '--fresh-install' ]; then
        FLAG_FRESH_INSTALL='1'
    elif [ $ARG == '--atom' ]; then
        FLAG_INSTALL_ATOM='1'
    elif [ $ARG == '--calendar' ]; then
        FLAG_INSTALL_CALENDAR='1'
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
          --calendar
          --docker
          --music-tools
          --password-manager
          --python
          --rss-client
          --rust
          --slack\n"
        exit 0
    else
        announce 'error' "Unknown argument '$ARG'"
    fi
done

get_distro

# INSTALL PACKAGES
if [ $FLAG_FRESH_INSTALL ]; then
    fresh_install
    unset FLAG_FRESH_INSTALL
fi

if [ $FLAG_INSTALL_ATOM ]; then
    install_atom_text;
    unset FLAG_INSTALL_ATOM
fi

if [ $FLAG_INSTALL_CALENDAR ]; then
    install_calendar
    unset FLAG_INSTALL_CALENDAR
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
