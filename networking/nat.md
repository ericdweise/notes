# Network Address Translation (NAT)

NAT is a way to translate a Router's external ip address to the internal ip address of a device in the internal network. 

NAT is useful because it allows us to send data to private IP addresses within the network by sending data to the network router.
The router is responsible for routing the data to the correct internal IP address.
So, even though two network devices might be assigned the same IP address on different network, for example, `192.168.0.5`, their respective routers can send and receive data for those devices as a proxy.

How is this done if there are multiple devices connecting to one router?



## NAT Overload / Port Address Translation
A device on the intranet connects to a network switch with a randomly chosen port number.
The router then performs NAT to send and receive data, translating the 

## Port Forwarding
Used for inbound communication to the intranet.
Map external IP:Port number and associate it with and internal IP:Port
AKA "Static NAT".






