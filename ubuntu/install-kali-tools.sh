How to install Kali Linux tools without Katoolin

1. Add the Kali repositories to apt sources:
    ```bash
    echo '# Kali Linux Repositories' | sudo tee -a /etc/apt/sources.list
    echo 'deb http://http.kali.org/kali kali-rolling main contrib non-free' | sudo tee -a /etc/apt/sources.list
    echo 'deb-src http://http.kali.org/kali kali-rolling main contrib non-free' | sudo tee -a /etc/apt/sources.list
    echo 'deb http://http.kali.org/kali-security kali-rolling/updates main contrib non-free' | sudo tee -a /etc/apt/sources.list
    echo 'deb-src http://http.kali.org/kali-security kali-rolling main contrib non-free' | sudo tee -a /etc/apt/sources.list
    ```

2. Install dirmgmt
    ```bash
    sudo apt install dirm
    ````

3. Try to update:
    ```bash
    sudo apt update
    ```
    This will cause an error saying "The following signatures couldn\'t be verified because the public key is not available: NO_PUBKEY _KEY_"

4. Add the key:
    ```bash
    sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys _KEY_
    ```

5. Update and install tools
    ```bash
    sudo apt update && sudo apt upgrade
    ```
