# Network Devices


## Hub

- OSI Level 2, Data Link
- Receive frame from a host on one port, transmit on every other port
- create collision domain

## Bridge

- connect two hub networks into one.
- uses mac address filtering to only send frames between hubs if the sending and receiving hosts are connected to different hubs.
- Allows a larger hub network while decreasing collisions.

## Switch

- Exist in OSI layer 2, Data Link
- Keeps a Source Address Table, maps the MAC address of a host to the port it is attached to.
- only sends frames to the port where the destination MAC address is attached.
- Collisions occur significantly less frequently than a hub network
- If a frame has an unknown MAC address then it is sent to all hosts.

### Managed Switch
A network switch that offers lots of configuration options.
These can be:

- Bandwidth per port
- Duplex setting per port
- etc

### Multi-Layer Switch
A switch that also operates as a router.
That means it has both a broadcast domain, but can route layer 3 packets based on IP address, too.
Some things that multi-layer switches can do:

- Load-balancing
- Traffic shaping
- Port bonding (combining multiple ports to increase bandwidth)
- Can run Intrusion Detection Systems
- Port mirroring (sending identical data out two ports)
- Port authentication




## Transceiver
a modular network device designed to provide a seamless link between different types of network interfaces (e.g. copper and fiber, or vice versa)

### Gigabit Interface Converter (GBIC)

- Modular (hot swappable) interface
- Converts optical signals to electrical signals (and visa-versa)
- Data transfer of 1 Gbps

### Small Form Factor Pluggable (SFP)

- Small form factor transceiver
- Newer transceiver type that replaces GBIC
- Hot swappable
- Transmission rate of 1 Gbps

### Small Form Factor Pluggable Enhanced (SFP+)

- Commonly used in 10GBase networks
- Transmission rate of 16 Gbps

### Quad Small Form-factor Pluggable (QSFP)

- Hot swappable
- 4 Gbps
