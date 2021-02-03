# The TCP/IP Stack


## A simple IP Header

```
[ Version | Length | DSCP | TTL | Protocol ]
```

- Version: `4` or `6`, depending on whether IPv4 or IPv6 is being used
- Length: The length of the packet in bytes
- Differentiated Services Code Point: Contains bandwidth sensitive data (e.g. VoIP)
- Time To Live (TTL): A counter that is decremented every time a packet goes through a router. Maximum value is 255
- Protocol: Usually `TCP` or `UDP`


## TCP
- Connection-Oriented Protocol
- Data is broken up and given a sequence number

### Three Way Handshake
Used to start a TCP connection.
This dance must be performed by two machines before they can send TCP data

1. `SYN`: Machine 1, "Are you there"
2. `SYN-ACK`: Machine 2, "Yes I'm Here"
3. `ACK`: Machine 1, "Cool, I'm sending data" (or requesting data, which is itself data...)


## UDP

### UDP Header
 
```
[ Source Port | Destination Port | Length | Checksum ]
```
