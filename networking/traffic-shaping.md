# Traffic Shaping





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
Adds two fields to the IP Header:

#### Differentiated Services Code Point (DSCP)
- 6 bits

#### Explicit Congestion Notification (ECN)
- 2 bits
- Takes Values:
    - 00 - Not QoS Aware
    - 01 - QoS Aware, no congestion
    - 10 - QoS Aware, no congestion
    - 11 - QoS Aware, congestion present
