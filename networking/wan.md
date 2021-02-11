# Wide Area Network (WAN)

While the line between LANs and WANs is ill defined I will include notes on ISPs and Regional Network Operators under the umbrella of WANs.





## Circuit Switch Network
A circuit is established before data is transferred.
The circuit cannot be used by other services if it has already been established between two services.
However, the connection is always there, and will not be unavailable when you want to send data.

## Packet Switching Network
Data is grouped into packets before it is sent.
Network is shared with all other devices, and they can all talk (roughly) at the same time.
Since everyone can talk at once it should support Quality of Service (packet prioritization)

### Types
- SONET
- DSL
- Frame Relay
- MPLS
- Cable Modem and Satelite





## Regional Networks
Historically, WANs didn't communicate using ethernet.
(But, this is changing with new fiber networks.)
Instead they use/used different protocols, namely T1/T3 and SONET.





## Signaling Protocols
### Digital Signal 0 (DS0)
The earliest digital signal.
It uses 8 bits of data sampled 8000 times a second.
This gives it a total data throughput of 64 kbps.
This can satisfactorily send a human voice, but has been superceded with better technologies.

### Digital Signal 1 (DS1)
A DS1 frame contains 24 DS0 "channels" (and a frame bit.)
8,000 frames are sent per second giving a data rate of 1.544 Mbps.

### Digital Signal 3 (DS3)
A DS3 frame contains 672 DS0 channels (and a frame bit.)





## T1/T3 (Copper)
The T-level networks are copper based regional networks.
They transmit digital data between regional hubs (usually owned by an ISP.)

These operate using Point to Point connections, so frame headers are very simple.

The analogous (but not exact same) Europe standards are called E1 and E3.

|    | Wires      | Connector | DS0 Channels | Data Rate   |
|----|------------|-----------|--------------|-------------|
| T1 | 2 tx, 2 rx | RJ-48C    | 24           | 1.544 Mbps  |
| E1 | 2 tx, 2 rx | RJ-48C    | 32           | 2.048 Mbps  |
| T3 |            |           | 672          | 44.736 Mbps |
| E3 |            |           | 512          | 34.368 Mbps |

### Channel Service Unit / Digital Service Unit (CSU/DSU)
A physical device that connects a customer's network to a T1 or T3 phoneline.
Can also be used to connect T1 and E1 lines.





## Synchronized Optical Network (SONET)
Another point to point protocol used in WANs.
Can combine multiple DS1, DS3, and E1 signals into one single frame.

### Optical Carrier Standards
These set the standards for different data throughputs over optical cables.
The standards increase in data throughput.

### Synchronous Transport Signal (STS)
The STS protocol specifies a frame that is sent over SONET networks.
The **Overhead** is similar to a header, and specifies the signaling and protocol information (e.g. OC-1 - OC-768)
Correlate directly to different OC standards.

### Wavelength Division Multiplexing (WDM)
A method for sending multiple signals over an optical cable at one time.
Gives each signal it's own wavelength.
The newest version, **Dense WDM (DWDM)** can send up to about 150 signals at once
Each signal is capable of the full data throughput.
So, WDM essentially multiplies the data throughput by the number of signals being used.

#### Coarse Wavelength Division Multiplexing (CWDM)
This too uses multiple wavelengths but is simpler to implement than DWDM.
Can also send data over longer distances than DWDM.





## Packet Switching
At the end of a Point to Point connection the data needs to be sent to multiple hosts.
Therefore, more complicated addressing is needed.
At these terminuses a pat switching device unpacks packets from the T1, T3, STM, etc frames and directs them to the correct host.

### Frame Relay
- An old packet switching standard
- It is used mostly with T lines
- No guarantee of data reliablility (this is left to higher level protocols)
- Is being replaced by, among others, MPLS 

### Asynchronous Transfer Mode (ATM)
- Another standard on its way out
- Was designed with voice and video transfer in mind
- Fixed cell size of 53 bytes
- Minimizes data transfer delay (at the expense of data loss rate)

### Multi-Protocol Labeled Switching (MPLS)
This is a protocol that sits somewhere inbetween Datalink and Network.
The protocol inserts one or more "Labels" inbetween the Ethernet frame and IP packet headers
Here is a typical MPLS Label:

```
[  Label  |  Experimental Bits  |  BLS  |  TTL  ]
```

- Label: A UID that tells MPLS routers how to direct data
- Experimental Bits: A sort of QoS tag. Higher values are prioritized
- Bottom of Label Stack (BLS): A frame can contain multiple labels. The very first Label in a frame has BLS set to 1. BLS is a single bit
- Time To Live (TTL): The number of hops the label can travel before being dropped

This schema allows routers that are MPLS capable to be put into the network and route standard traffic with minimal changes to the IP packets being sent.





## Metropolitan Area Network (MAN)
An implementation of Ethernet on a city-wide scale.





## Dial Up Connections
One of two classes of connections from a LAN to a WAN.
These create a connection whenver data needs to be transfered, then after the connection is dropped.

### Public Switch Telephone Network (PTSN)
- A.k.a **Plain Old Telephone Service (POTS)**
- Analog signal (so requires a modem and a UART device)
- 2400 baud rate (2400 hertz base signal)
- Use RJ-11 connectors

#### V Standards
These specify the maximum baud-rate a modem is capable of.
When two modems communicate they negotiate the largest V standard supported by both.


### Integrated Services Digital Network
Similar to the PTSN, but communicates to the customer using digital signals.

- Bearer (B) channels communicate using DS0
- Delta (D) channels carry up to 16 kbps
- Limited to about 18,000 ft from the provider
- There are two common types of lines:
    - **Basic Rate Interface** is a single line that has two B and one D channels
    - **Primary Rate Interface** is a T1 line with 23 B channels





## Dedicated Connections.
A type of connection to the WAN that is always available, even when data is not being transferred.

### Digital Subscriber Line (DSL)
Not much different from ISDN, except that the connection is never terminated.

- Uses RJ-11
- Symmetric DSL (**SDSL**) has equal upload and download speeds
- Asymmetric DSL (**ADLS**) download speeds are faster than upload speeds
- No new network cables required, can use the same infrastructure as ISDN
- Limited to about 18,000 ft from the provider

### Broadband Cable

- Runs on coaxial "TV" cable
- Use a Cable Modem
- Usually much faster than DSL (5 to 200 Mbps download, up to 10 Mbps upload)
- The protocol used is called **Data Over Cable Service Interface Specification (DOCSIS)**





## Point to Point Protocol
- Dial up connections use PPP
- Only DSL uses PPPoE
- Neither Broadband Cable nor Satellite use PPPoE or PPP
