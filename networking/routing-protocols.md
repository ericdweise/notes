# Routing


## TODO
- Trunk port
- IEEE 802.1Q
- RTP
- SRTP
- RDP
- STP
- RSTP

## Routing Table
A routing table has 5 columns:

|                     |                                      |                                   |
|---------------------|--------------------------------------|-----------------------------------|
| Network Destination | Defines local network                |                                   |
| Netmask             | Defines local network                |                                   |
| Gateway             | IP address of the next hop router    | `0.0.0.0`, etc.                   |
| Interface           | What port to send the packet through | WAN, LAN, IP Address, gig0/0, etc |
| Metric              | Route priority                       | Positive integers                 |


### static route

### Default route
a "last resort" network path used by a router for forwarding all packets with destination addresses not listed in its routing table.

### Metric
Routes with lower metrics will be used first.

## MAC address table

## ARP table

### 

## Routing Protocols
Calculate the most efficient way to send an IP packet through one or more routers.
The cost functions vary, but can be based on things like number of hops, latency, MTU, bandwidth, etc.
In the end, these protocols aim to set the Metrics in a router's routing table.

### Distance Vector
Calculates the cost to get from a router to a particular network ID.

1. A router transfers it's route table to other routers in the WAN.
2. The recieving router will add it's route table to the recieved by splitting network destinations and adding it's metrics to the the new Netmasks.
3. The new route table is then forwarded to all other routers.

The eventual result is every router in the WAN will recieve every other routers route table, possibly several times, depending on how many 
The router can then update it's own route table to reach other routers if there is a route with an overall lower metric.

Eventually, routers in a WAN will reach steady state.
They will, however, continue to send their routing tables, even though nothing has changed.
When the network topology changes and certain routes become unavailable, or new, lower cost/metric routes become available, this will be reflected in the entire network.

Distance vector works for relatively few routers in a WAN, but not for the entire internet.

#### RIPv1
- maximum hop count: 15
- update interval: 30 seconds
- can loop back to original router

#### RIPv2
- much the same as RIPv1, with added features
- Variable Length Subnet Masking (VLSM)
- Router Authentication (so hackers can't add spurious route tables to the network)


### Link-State
- faster and takes less bandwidth than RIP
- Only broadcast changes as they occur (as opposed to broadcasting every 30 seconds)

#### Open Shortest Path First (OSPF)
- most popular dynamic routing protocol
- 

Upon startup router sends "hello packets"
Adjacent routers form a _neighborship_
**Link State Advertisement (LSA)** is used to flood the router network
When flooding is complete each router chooses its own best routes

- cost is a function of bandwidth
- send only updates (as opposed to continual broadcasting
- Supports authentication
- shortest path first (prevents loops)
- Until recently didn't support IPv6 addresses

#### Intermediate System to Intermediate System (IS-IS)
- very similar to OSPF (send only updates)
- supported IPv6 much earlier than OSPF
- default standard on ISPs

### Border Gateway Protocol (BGP)
A Hybrid routing protocol that is the backbone of the global internet.

#### Autonomous Systems
- sit at the top of the heirarchy in 
- Address are Autonomous System Numbers (ASNs) 32 bits, represented as two 16 bit separated by a dot: `123.456'
- Talk to eachother using Exterior Gateway Protocol (EGP)
- Talk to their subnetwork using Interior Gateway Protocol (IGP)


### Enhanced Interior Gateway Routing Protocol (EIGRP
- Cisco proprietary protocol
- hybrid or "Advanced Distance Vector Protocol" (on CompTIA Network+ exam as **distance vector**)
