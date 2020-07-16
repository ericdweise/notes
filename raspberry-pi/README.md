Just a few notes so that I don't have to repeat web searches later on.


# Bootstrapping

## Enabling SSH
```bash
touch /boot/ssh
```

## Disable Graphics
```bash
sudo update-rc.d lightdm disable
```

## Create new user
```bash
NEW_USER=''  # name of your new user

sudo useradd $NEW_USER
sudo passwd $NEW_USER
sudo usermod -aG sudo $NEW_USER
```

## disable pi user
```bash
sudo usermod -L pi
```


## Connecting to network
```bash
SSID=''  # Network SSID.
PASS=''  # Network Password

echo "

allow-hotplug wlan0
iface wlan0 inet dhcp
wpa-ssid \"$SSID\"
wpa-psk \"$PASS\"" | sudo tee -a /etc/network/interfaces
```


# Troubleshooting

## LED warning flash codes
[LED Codes](https://www.raspberrypi.org/documentation/configuration/led_blink_warnings.md)
