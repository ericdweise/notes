# Software Tools
These are some of the tools used to diagnose problems and explore




## Finding Local Address Information
### Linux `ip`
` `ip addr` shows network interfaces and information
` `ip down IFACE; ip up IFACE` resets the prescribed interface

### Windows `ipconfig`
- `ipconfig /all` prints all interface TCP/IP _and_ physical information
- `ipconfig /release` and `ipconfig /renew` will reset DHCP information

### MacOS `ifconfig`
`ifconfig -a` prints all interface intormation 




## DNS Information

### `nslookup`
- Query the DNS server for an IP address
- Preferred tool on Windows

### `dig` Domain Information Groper
- Query the DNS server for an IP address
- Preferred tool on Linux




## Router Information
### `route print`
- Print the current devices route table

### `pathping`

### Linux `traceroute`
### Windows `tracert`

### Windows `pathping`
Combines `traceroute` and `ping` into one tool




## `arp`
Used to resolve MAC addresses from IP addresses.
- `arp -a` Print the device's ARP table




## `netstat`
- Used to find which applications are currently using network resources
- `netstat -b` shows which applications are accessing the network



## `nmap`
Used to discover devices on the netowrk.




## `ping`
- Used to see if a device is accessible
- Uses ICMP, which might be blocked on some devices




## `iptables`
- Linux firewall command line tool
