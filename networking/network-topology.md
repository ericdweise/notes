network-topology

# Network Topology

This page is a collection of notes on network topologies.


## Network Segmentation

## Spanning Tree Protocol

## Managing Traffic
AKA Packet Shaping or Traffic Shaping.
This is a way of prioritizing certain packets over others.
There are many ways to implement this.
Two standards are described below:

### Class of Service (CoS)
This is performed in the Ethernet Frame Header in the 802.1Q trunk.
It is only performed in switch devices.

### Differentiated Services
Performed in the IP Frame Header.
This is usually performed inside of routers or firewalls.


## Network Address Translation (NAT)
NAT is a way to translate a Router's external ip address to the internal ip address of a device in the internal network. 

NAT is useful because it allows us to send data to private IP addresses within the network by sending data to the network router.
The router is responsible for routing the data to the correct internal IP address.
So, even though two network devices might be assigned the same IP address on different network, for example, `192.168.0.5`, their respective routers can send and receive data for those devices as a proxy.

How is this done if there are multiple devices connecting to one router?



### NAT Overload / Port Address Translation
A device on the intranet connects to a network switch with a randomly chosen port number.
The router then performs NAT to send and receive data, translating the 

### Port Forwarding
Used for inbound communication to the intranet.
Map external IP:Port number and associate it with and internal IP:Port
AKA "Static NAT".



## Access Control Lists (ACL) and Firewall Rules
Act on routers.
A list of logical requirements that either allow or deny traffic.
Can act on many things, like:
- source/destination IP address
- time of day
- port number
- application
- protocol

Most rules have an implicit deny, so that any traffic not allowed by a previous rules in the list are denied by default


## Circuit Switch Network
A circuit is established before data is transferred.
The circuit cannot be used by other services if it has already been established between two services.
However, the connection is always there, and will not be unavailable when you want to send data.

### Types
- POTS (plain old Telephone Service)
- PTSN (Public Switched Telephone Network)
- T1/T3 (aka E1/E3)
- ISDN (Integrated services digital network)

## Packet Switching Network
Data is grouped into packets before 
Network is shared with all other devices.
Since everyone can talk at once it will support Quality of Service (prioritization)

### Types
- SONET
- DSL
- Frame Relay
- MPLS
- Cable Modem and Satelite




