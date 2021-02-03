# Virtual Private Network

A VPN creates a tunnel between a device and a network device.

1. The host's NIC connects to a local router. This creates the internet connection for the device.
2. The VPN service creates a virtual NIC that connects to a remote network. This connects the

When a device is connected to a VPN, the virtual network traffic is tunneled to a virtual router.
That is, all Network Packets are first created with the VPN addresses, then they are encrypted and wrapped with another network layer for the local router to use to forward the packet through the internet.


## VPN Protocols
### Point to Point Tunneling Protocol (PPTP)
VPNs use this protocol to route network over the internet from a host to it's VPN router.
In PPTP, the endpoint on the server side is a software program running on a capable computer.
Data is secured by encrypting the data from the virtual NIC and passing it to the second NIC to add _real world_ Network and Datalink headers.


### Layer 2 Tunneling Protocol (L2TP)
An L2TP VPN can run over almost any type of connection, from ethernet to dial-up.
The biggest difference between L2TP and PPTP is that L2TP uses IPsec for its security.

### SSL VPN
This is a browser native type of VPN.
The network virtualization is performed in a web browser.
This allows a browser page to access network resources as if the page were connected to the network.
Encryption and authentication is all handled by TLS.

### Datagram TLS (DTLS)
As the name suggests, these VPNs use UDP instead of TCP.
They are used when latency and data delivery time are critical, for example video streaming.

### Dynamic Multipoint VPN (DMVPN)
A kind of distributed site-to-site VPN service.
If you are connecting multiple offices that all need to access each other.
This allows traffic to be routed to the correct router on the VPN without having to travel to a centralized VPN router.



## Types of VPN Connections
### Client-to-Site
A single computer connecting to a VPN.
Also called host-to-site

### Site-to-Site
A VPN tunnel is set up between two routers, typically separated by a long distance.

