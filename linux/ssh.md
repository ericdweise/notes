# Secure Shell (SSH)
Instructions for setting up the SSH Server on Linux



## Installing SSH Server

### Debian and Ubuntu
```bash
sudo apt install openssh-server
```


## Securing you SSH Server
So far a very incomplete list of things to do to make the computer running SSH Server more secure.
You will need root privileges to edit the `sshd_config` file.
This file is found in different places, here is where I know where to look for it:

| distro       | filepath                       |
|--------------|--------------------------------|
| Ubuntu 20.04 | `/etc/ssh/sshd_config`         |

As a last resort you can use `locate` or `find` to find the config file.

After you make any changes to `sshd_config` you will need to reload the server.
If you're running systemd you'll run

```bash
sudo systemctl restart sshd
```


And, if you're running sysvinit you'll run:

```bash
sudo service sshd restart
```



### Changing the Default Port
This will confuse basic port sniffers that check to see if port 22 is open.
Edit the `sshd_config` file and add or edit this line:

```bash
Port 12345  # Not 22!
```


### Enable SSH Keys
Why do this?
SSH Keys are probably more secure than your password, thus are harder to crack!

1. On your SSH Server enable SSH Key Logins by editing the `sshd_config` file. The default is to allow SSH Key Authentication, but make sure this line is included in yoru config:
    ```bash
    PubkeyAuthentication yes
    ```
2. NOTE: The rest of these steps will be run on your ssh client device (not the server)
3. Generate a Public-Private Key. Don't do this if you already generated a key in this file as it will be overwritten.
    ```bash
    ssh-keygen -t rsa -b 2048 -f ~/.ssh/server_rsa_file
    ```
4. Copy the public key to your ssh server. This command will copy your public key into `~/.ssh/authorized_keys`, but you can also do it manually.
    ```bash
    ssh-copy-id -i ~/.ssh/server_rsa_file.pub USER@HOST
    ```
5. Log into your server using your private key:
    ```bash
    ssh -i ~/.ssh/server_rsa_file USER@HOST
    ```


### Disable passwords
This won't allow a user to log in with their password.
CAREFUL: You will need to enable SSH Keys before you do this!
Edit the `sshd_config` file and add or edit this line:

```bash
PasswordAuthentication no
```
