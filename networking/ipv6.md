ipv6

# Internet Protocol version 6




That means there are $2^{128} \approx 3.4 \times 10^{38}$ addresses.
(Compare that to the $4.3 \times 10^{9}$ ipv4 addresses...)


## The Anatomy of an IPv6 Address
128 bit address.
Broken up into eight 16 bit blocks.
Each block expressed in hex.


## Network Prefix
A network prefix is handed down by the router immediately above the device.
When you get all the way down the tree to an end device (like a laptop) the network prefix is usually 48 bits.
That way the router can use 16 bits to subnet the hosts attached to it.
However, the router gets a somewhat less restrictive network prefix from its upstream router.
This progesses until finally the tier 1 routers.
Of course, this is the ideal case, but who knows what really happens?

Since this is a top down appropriation of the first 64 bits of an end device's IPv6 address this allows on the fly updates from the top to the bottom.

Ideally the passing along of network prefixes looks like this:

```
[Tier 1 Router]
    |
   1111::/16
    |
    v
[RIR Router]
    |__________________________
    |                          |
   1111.2222::/32             1111.3333::/32
    |                          |
    v                          v
[ISP Router 1]          [ISP Router 2]
    |
   1111.2222.3333::/48
    |
    v
[Home Router]
    |
   1111.2222.3333.4444/64
    |
    v
[end device]
```




## Interface ID
The interface ID is the second half of an IPv6 address.
It is created when a device connects to a network.
There are several ways this can be done, including:

- A modified EUI-64
- Through neighbor solicitation
- From a DHCPv6 server

### Interface ID via Modified EUI-64
Every device can choose an IPv6 address that is static and can be used to communicate world wide.
Uses the device's MAC address.
Need to convert the 48-bit MAC address into a 64-bit EUI.

Takes two steps:

1. Add 16 bits `FFFE` in the middle of the address.
2. Flip the 7th bit of the MAC, converting it from a **universal** to a **local** address.

#### An Example

|                      |                           |
|----------------------|---------------------------|
| IPv6 Subnet Prefix   | `2600:dddd:1111:0001`     |
| Device MAC Address   | `82:ed:aa:4b:98:a7`       |
| Add `FFEE`           | `82:ed:aa:FF:EE:4b:98:a7` |
| Group into 16 bits   | `82ed:aaFF:EE4b:98a7`     |
| Flip 7th bit         | `80ed:aaFF:EE4b:98a7`     |

So, the EUI-64 is `80ed:aaff:ee4b:98a7`, and the full 128 IPv6 address is `2600:dddd:1111:0001:80ed:aaff:ee4b:98a7`




## Global Unicast Address
This is the address that an IPv6 devices uses to talk to the internet.
It is assigned by the default gateway.
First, the device will multicast a router solicitation message.
Upon recieving the message, the router will tell the device the router's **Site Prefix** and the device's subnet.
These together form the first 64 bits of the device's _global unicast address_.
The device will then append it's **interface ID** (see below.)
The final 128 bits is the device's globally accessible IPv6 address.




## Link Local Addresses
In addition to the Global Unicast Address every IPv6 capable device gives itself a **link local** address on boot.
This address has prefix `FE80::/10` followed by 54 zero bits, or `fe80:0000:0000:0000`.
(Note: This is equivalent to `fe80::/64`, but it is always written `fe80::/10` with the remaining 54 bits implied.)

The Link Local Address of a device is the IP address it uses to talk to devices _locally_.

In some sense the  Link Local Address is Equivalent to IPv4's APIPA, except an APIPA address is only used as a last resort but every device will have a link local address in addition to it's global unicast address.




## Address Compression Rules
1. Remove leading zeros in each hex block: 
2. [Junction rule] If there are sequential blocks of `0`s then they are joined using a double colon: `::`. For example, `0000:0000:0000` can be joined together as `::`.
3. IF there are two disjoint sequences of `0`s, then only one will have the junction rule applied. This helps us avoid ambiguity that arises when expanding two or more `::`s.

### Compression Rule Examples
```
FE82:0000:0000:0000:0000:1A12:1234:1A12
FE82:   0:   0:   0:   0:1A12:1234:1A12    (Apply rule 1)
FE82         ::         :1A12:1234:1A12    (Apply rule 2)
FE82::1A12:1234:1A12                       (Final compressed address)


FE82:0000:0000:1234:0000:0000:0000:1A12
FE82:   0:   0:1234:   0:   0:   0:1A12    (Apply rule 1)
FE82:   0:   0:1234       ::       1A12    (Apply rule 2)
FE82:0:0:1234::1A12                        (Final compressed address)
```




## Multicast
Unlike IPv4, IPv6 does not use broadcasting.
Instead, it uses a Multicast

The ethernet frame of a multicast in IPv6 starts always has the form: `33:33:..:..:..:..`.






## Reserved Addresses

| Address         | Use                            |
|-----------------|--------------------------------|
| `::1`           | loopback                       |
| `ff02::1`       | multicast read by all hosts    |
| `ff02::2`       | multicast read only by routers |
| `ff0x::101`     | NTP                            |
| `2001:0000:/32` | Teredo                         |
| `2002:/16`      | 6to4 addresses                 |




## Neighbor Discovery Protocol (NDP)
This is a protocol that IPv6 devices use to find other devices in and information about its broadcast domain.

### Neighbor solicitation
This is functionally equivalent to an IPv4 ARP request.
When a new host joins a network it sends out a **neighbor solicitation** message in its broadcast domain.

### Neighbor advertisement
When a device recieves a _neighbor solicitation_ message it replies with a **neighbor advertisement**.
This message just tells the new device what the responding device's IPv6 address is.

### Router solicitation
A device (router or end device) can use a **router solicitation** message to ask for the network's WAN IP address (network ID and subnet).

### Router advertisement
The **router advertisement** message is sent by a router to it's downstream devices.
It tells these devices things like it's WAN IP address, default gateway, DNS server, etc.
This happens periodically, or in responce to a _router solicitation_ message.




## DHCPv6
The top down nature of IPv6 is fairly restrictive.
Every bit of information comes from the router above.
DHCPv6 allows for fine grained control, for instance, running your own DNS.

### Stateful DHCPv6
Stateful DHCPv6 is very much like its IPv4 predecessor.

The server uses UDP:547 and the the client uses UDP:546 to communicate.

There might be many DCHPv6 servers that are accessible by a client.
Every DHCPv6 server is listening on `FF02::1:2`.

Steps:

1. [client to server] Solicit message via multicast to `FF02::1:2`. There might be multiple DHCP servers listening to this address..
2. [server to client] A DHCPv6 Advertise message is sent from every DHCPv6 server to the device.
3. [client to server] Client chooses a DHCPv6 server and sends a DHCPv6 Request to it.
4. [server to client] The chosen DHCPv6 server sends a DHCPv6 Reply confirming it will take the provided network ID.

### Stateless DHCPv6
Where stateful DHCPv6 exerts full control over IP addresses, default gateway, etc, **stateless DHCPv6** recieves router advertisement messages from upstream and forwards modified messages to its downstream devices.
Most of the information stays the same, however things like default gateway or DNS can be changed.




## Network Control Protocol (NCP)
Used by routers



## Interaction with IPv4 Stacks
During the transition period from ipv4 to ipv6, there will be area in a route which ipv6 traffic needs to traverse an ipv4 only connection, or visa-versa.
This can be done using tunneling.
Several methods have been created to do this.

### 4to6
An ipv4 packet is encapsulated with an ipv6 header.

### 6to4
A deprecated standard, but it is essentially the reverse of 4to6

## 6in4
A working standard that allows ipv6 tunneling through ipv4 connections.
Can traverse through NAT.


### Teredo
A Microsoft tunneling protocol that allows ipv6 to use ipv
Can traverse through NAT.

#### Miredo
An open source implementation of Teredo used on Linux.

### Intra-Site Automatic Tunnel Addressing Protocol (ISATAP)
This protocol appends an IPv4 address to an IPv6 prefix.

### NAT64
Embeds an ipv4 packet into an ipv6 packet.
This is usually put where a NAT would be at the edge of a network.





## Quick Maths


### Bit Flips
The result of flipping the 7th bit has the following result on the last HEX element of the first 16 bit block.
`0` &harr; `2`
`1` &harr; `3`
`4` &harr; `6`
`5` &harr; `7`
`8` &harr; `A`
`9` &harr; `B`
`C` &harr; `E`
`D` &harr; `F`

So, flipping the 7th bit on `12:34:...` gives `10:34:...`.
And flipping the 7th bit on `AA:00:...` gives `A8:00:...`.
