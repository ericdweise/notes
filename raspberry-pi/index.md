# Raspberry Pi's


Note, these things work on Ubuntu Server, but some may not work on Raspberry Pi OS.


## Networking

### Enable SSH
```bash
touch /boot/ssh
```

### Connect to WiFi
This can be done several different ways.



#### Network Config
This is supposed to work on Ubuntu Server for Raspberry Pi, but I can't test because I think my wifi card is broken.

Edit the `network-config` file in the boot partition of a newly flashed SD card.
It has an example configuration aleady in the file.
First uncomment the block, then change the network name and passwords.
The network name and password will always need to be enclosed in double quotes.

You will need to reboot the Pi twice for these changes to take effect.


#### WPA Supplicant
This works on Raspberry Pi OS

Create a file called `wpa_supplicant.conf` in the boot partition of a newly flashed SD card.
The should contain the following:

```
country=US
ctrl_interface=DIR=/var/run/wpa_supplicant GROUP=netdev
update_config=1
network={
    ssid="YOURSSID"
    scan_ssid=1
    psk="YOURPASSWORD"
    key_mgmt=WPA-PSK
}
```




## Secure User Accounts

Add a new user
```bash
sudo adduser <NEW_USER>
sudo usermod -aG sudo <NEW_USER>
```

Log out of the pi user and log into your new user account.
```bash
logout
```

Delete the old `pi` user
```bash
sudo deluser --remove-home pi
```




## Disable Graphics
```bash
sudo update-rc.d lightdm disable
```




## Troubleshooting

### LED Warning Flash Codes
[LED Codes](https://www.raspberrypi.org/documentation/configuration/led_blink_warnings.md)

### DPKG Lock on Ubuntu Server
If after first boot dpkg is locked because there is an `unattended-upgr`, then follow these steps:

1. Disable automatic updates: `sudo dpkg-reconfigure -plow unattended-upgrades`
2. Restart pi: sudo reboot`
3. Upgrade system: `sudo apt update && sudo apt upgrade`
4. Renable automatic uppdates: `sudo dpkg-reconfigure -plow unattended-upgrades`
5. Reboot again: `sudo reboot`
