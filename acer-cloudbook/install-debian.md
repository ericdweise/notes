Instructions for installing Debian 9 on the Acer Cloudbook with eMMC storage.

# Steps
1. Boot computer and get to the "Debian GNU/Linux installer boot loader"

2. Press `esc` key to get to the grub command-line

3. Enter the following command:
```grub
install /install.amd/vmlinuz desktop=xfce vga=788 noapic edd=off quiet
```

4. You will need to add the iwlwifi firmware. Can be found one of these places:
    * https://github.com/OpenELEC/iwlwifi-firmware/blob/master/firmware/iwlwifi-3160-17.ucode
    * https://packages.debian.org/sid/firmware-iwlwifi

5. Proceed with installation as you normally would


# Specs
## Computer
Acer Cloudbook 11
Year: 2015
Model No: N15V1

## Debian
Debian 9 with XFCE desktop
