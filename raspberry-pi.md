# Raspberry Pi's

## Bootstrap Installation

### Enable SSH
```bash
touch /boot/ssh
```

### Disable Graphics
```bash
sudo update-rc.d lightdm disable
```

### Create New User
```bash
NEW_USER=''  # name of your new user

sudo useradd $NEW_USER
sudo passwd $NEW_USER
sudo usermod -aG sudo $NEW_USER
```

### Disable pi User
```bash
sudo usermod -L pi
```

### Connect to WiFi Network
```bash
SSID=''  # Network SSID.
PASS=''  # Network Password

echo "

allow-hotplug wlan0
iface wlan0 inet dhcp
wpa-ssid \"$SSID\"
wpa-psk \"$PASS\"" | sudo tee -a /etc/network/interfaces
```


## Troubleshooting

### LED Warning Flash Codes
[LED Codes](https://www.raspberrypi.org/documentation/configuration/led_blink_warnings.md)
