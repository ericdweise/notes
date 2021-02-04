osi-model

# OSI - Open Systems Interconnection Reference Model
The OSI is a guide that simplifies how we think about how data travels through a network.
This is not a standard or a protocol.
It is, for all intents and purposes, a mental model used for understanding and communicating network principles.


## Pneumonic Devices
Top Down: A Priest Slapped The Nun During Prayer

Bottom Up: Please Do Not Touch Steve's Pet Alligator




## The Layers

### 1 - Physical Layer
The cables or radiowaves that carry signals.
A problem here means that a cable is broken or disconnected

|           |                                                   |
|-----------|---------------------------------------------------|
| PDU       | Bit                                               |
| Devices   | Cables, transcievers, hubs, and repeaters, modems |


### 2 - Data Link
Most fundamental communication that happens across the network

|           |                                             |
|-----------|---------------------------------------------|
| PDU       | Frame
| Elements  | Ethernet, MAC Address, EUI, CSMA/CD
| Devices   | Switches, bridges, NICs
| Domains   | Collision Domain


### 3 - Network
AKA the Routing Layer.
IP addresses
will deal with fragmenting data in the frames so that it can transverse different networks.

|           |                                             |
|-----------|---------------------------------------------|
| PDU       | Packet                                      |
| Protocols | IP, ICMP, ARP, RIP, IGRP                    |
| Devices   | Routers, Bridges, Network Adapters, WAPs    |
| Domains   | Broadcast Domain


### 4 - Transport
The "Post Office" layer.
Adds the port to the data packet.


|           |                                             |
|-----------|---------------------------------------------|
| PDU       | Segment                                     |
| Protocols | TCP and UDP                                 |
| Devices   | Intrusion Detection Systems, load balancers |


### 5 - Session
How applications talk across the network.
Responsible for establishing, managing, and terminating the session

|           |                                             |
|-----------|---------------------------------------------|
| PDU       | "Data" (no specific name)
| Elements  | Application endpoints, tunneling
| Protocols | NetBIOS


### 6 - Presentation
Formats the information so that it is understood by the receiving system.
Shares several responsibilities with layer 7.

|          |                                             |
|----------|---------------------------------------------|
| PDU      | "Data" (no specific name)
| jobs     | Character Encoding, Encryption, Compression


### 7 - Application
What the user sees, e.g. a browser.
Responsible for initiating or services the request.

|          |                                             |
|----------|---------------------------------------------|
| PDU      | "Data" (no specific name)
| Elements | SMTP, DNS, HTTP, and Telnet



## Asynchronous Transfer Mode (ATM)
This is an old replacement layer for the OSI Datalink layer.
It is the basis for SONET/SDH, on which PSTN and ISDN are based.

IP based networks have largely replaced ATM.

|          |                                             |
|----------|---------------------------------------------|
| PDU      | Cell (53 octet long)
| Elements |
