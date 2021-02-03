ip-layer

# Internet Protocol (IP)

## Dynamic Host Configuration Protocol (DHCP)
- Stopped at Router (not sent outside of network)
- Can use a DHCP helper to forward DHCP broadcast to unicast directed at external DHCP server.

### Steps

|---|------------|------------------|-----------|
| 1 | `DISCOVER` | client to server | Broadcast |
| 2 | `OFFER`    | server to client | Broadcast |
| 3 | `REQUEST`  | client to server | Boradcast |
| 4 | `ACCEPT`   | server to client | Unicast   |






## Automatic Private IP Addressing (APIPA)
- Also called **zeroconf**
- A fallback when there is no DHCP server
- Allows computers on a LAN to communicate
- Network Address is `169.124.0.0/16`
- Clients will randomly choose the final two octets
- If the randomly chosen octets are already taken then another two are generated
- No default gateway, and therefor






## Network Address Translation (NAT)

### (PAT)


### Port Forwarding








## Communication Types

### Unicast
Sends an IP packet to one specific IP address.

### Broadcast
- Used in IPv4 only
- sent to all clients on a subnet
- The broadcast address is the largest possible IP address in a subnet. E.g. 

### Multicast
- Used in IPv6 only
- specify a range of 







## Managing Traffic

### Packet Shaping

### Quality of Service (QoS)

### Class of Service (CoS)
A field in the Ethernet Frame Header
functionality provided: QoS and Traffic Management

### DiffServ



## Traffic Shaping

### Access Control List




## Routers



## Subnetting


## TODO:
VIP/VIPA
