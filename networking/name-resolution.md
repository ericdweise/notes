# Name Resolution Protocols


## NetBIOS
- Pre DNS
- Microsoft protocol
- Used Broadcasting (unwieldy on large networks)
- Designed for un-routed networks with fewer than 40 hosts


## NetBIOS over TCP/IP (NetBT)
- remove reliance on NetBEUI
- Ports (yes, these are correct...):
    - tcp:137  _name registration and resolution_
    - tcp:139  _connection-oriented communication_
    - udp:137  _name registration and resolution_
    - udp:138  _datagram distribution service_
- NetBT is used only on the LAN. So a host has one NetBT name on the LAN, and can have a different one on the WAN (which uses DNS)


## Domain Name Services DNS

### DNS Names
- DNS Names can be made of `a-z`, `0-9`, and `-`
- Capitalization does not matter
- Can be up to 255 characters long, including separating `.`s

### Root Servers
There are 13 servers that sit at the top of the Domain Server stack.
These delegate responsibilities to their top level domain servers.

### Top Level Domain Servers
These handle the Top Level Domain Names.
E.g. `.com`, `.net`, `.gov`, etc.

### Second Level Servers
These support individual computers.

