# Using Android with Linux


## Transferring Files to Debian
1. `sudo apt install jmtpfs`
2. Debian only: `sudo apt install fusermount`
3. Connect android to computer (USB)
4. Enable `File Transfer` on phone
5. Make mount point: `mkdir ~/android`
6. Mount phone: `jmtpfs ~/android`
7. Move files
8. Unmount: `fusermount -u ~/android`
