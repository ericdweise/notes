# Cable Types





## Coaxial
### Uses
- Cable modem to ISP
- TVs
- Cable Boxes
- Satellite Recievers
- short distances

### Connector Types
#### BNC (AKA Bayonet)

| BNC (a.k.a Bayonet)                          | F-Type                                         |
|----------------------------------------------|------------------------------------------------|
| ![image](./assets/images/bnc-connector.jpeg) | ![image](./assets/images/ftype-connector.jpeg) |
| Push and twist                               | Screw in                                       |

### Radio Guide (RG) Rating
- A measure of the characteristing impedence of the wire.

| Rating | Ohms | Use        | Connector |
|--------|------|------------|-----------|
| RG-58  | 50   | Networking | BNC       |
| RG-59  | 75   | Cable TV   | F Type    |
| RG-6   | 75   | Cable TV   | T Type    |







## Twisted Pair
One cable contains one or more pairs of wires inside.
Each pair is twisted  like a strand of DNA
Twisted pairs come with different types of shielding.
The shielding types are indicated in the wire names.

### Connectors
Copper twisted cables use the Registered Jack (RJ) connectors.

#### TIA/EIA 568A and 568B
The standards documents are put out by the Telecommunications Industry Association/Electronics Industries Alliance.
This has been replaced by the ANSI/TIA 568C, but that's not on the CompTIA Network+ exam.

The difference between the 568A and 568B standards is that the Green and Orange cables are switched.
This is important because if one host is transmitting on green, the other host must be receiving on green (unless a switch or other network device switches the signal wires.)

![img](./assets/images/tia.eia.568ab.jpeg)

#### RJ-11
Supports 2 twisted wire pairs.

#### 8P8C (not RJ-45)
But they are commonly called RJ-45, even on the CompTIA Network+ exam.
Supports 4 twisted wire pairs.

### Cat Ratings
This table shows the evolution of the Cat cables in terms of network speeds.

| Cat | Freq (MHz) |Max Bandwidth | 10BaseT   |  100BaseT | 1000BaseT | 10GBaseT  |
|-----|------------|--------------|-----------|-----------|-----------|-----------|
| 3   | 16         | 16 Mbps      |           |           |           |           |
| 4   | 20         | 20 Mbps      |           |           |           |           |
| 5   | 100        | 100 Mbps     |           | 100m      | in 4 pair |           |
| 5e  | 100        | 1 Gbps       | 100m      | 100m      | 100m      |           |
| 6   | 250        | 10 Gbps      | 100m      | 100m      | 100m      | 55m       |
| 6a  | 500        | 10 Gbps      | 100m      | 100m      | 100m      | 100m      |
| 7   | 600        | 10+ Gbps     |           |           |           |           |
| 7a  | 1000       | 100 Gbps     |           |           |           |           |
| 8   | 2000       | 40 Gbps      |           |           |           |           |

CAT 7 introduces new connector types: GG45 and TERA.

### Shielding
#### FTP vs UTP
Indicates wheather each wire pair is shielded or not

| Unshilded Twisted Pair (UTP)       | Foil Twisted Pair (FTP)            |
|------------------------------------|------------------------------------|
| Each wire pair is unshielded       | Each wire pair is wrapped in foil  |
| ![img](./assets/images/utp.jpeg)   | ![img](./assets/images/ftp.jpeg)   |


#### Cable Shielding
In addition to the wire pair shielding, the entire cable can be shielded.
The following

#### Twisted Pair Cables
Available twisted pair cables:

| Cable  | Pair Shielding | cable Shielding       |
|--------|----------------|-----------------------|
| F/UTP  | none           | foil                  |
| S/UTP  | none           | braided wire          |
| SF/UTP | none           | braided wire and foil |
| S/FTP  | foil           | braided wire          |
| F/FTP  | foil           | foil                  |
| U/FTP  | foil           | none                  |





## Fiber Optic
### Multi-Mode Fiber (MMF) vs Single Mode Fiber (SMF)
- Multi-Mode (MMF) use LEDs
- Single Mode Fiber(SMF) use lasers

SMF is better over long distances because lasers have a uniform wave front.
LEDs on the other hand shine in different directions and can cause the signal to disperse in the wire.
As the light propagates components not orthogonal to field direction bounces more and travels farther.

### Connectors

|       |        |                      |       |
|-------|--------|----------------------|-------|
| ST    | single | snap twist           |       |
| SC    | single | stick & click (push) |       |
| MT-RJ | duplex |                      | SFF   |
| LC    | duplex | smaller than mtRJ    | SFF   |

### Small Form Factor
-MT-RJ and LC are considered SFF

#### Ultra Physical Contact (UPC)
- polished glass
- spherical surface, better than flat surfaces because flat surfaces leave a small gap because of surface imperfections

#### Angled Physical Contact (APC)
- still spherical, polished, glass surface
- adds an 8 degree tilt.
- tilt lowers signal loss even further
- tilt also reduces surface degredation after successive insertions


The shape and angle of the tip of a fiber-optic connector can have an impact on the performance of a fiber-optic communication link. The two basic types of fiber end are Ultra Physical Contact (UPC) and Angled Physical Contact (APC). In the UPC-type connector, the connector end is polished with no angle, while APC connectors feature a fiber end polished at an 8-degree angle. Besides additional labeling (UPC or APC) that helps in identifying further details about a given connector type, fiber-optic connectors can also have different colors. The rule of thumb is that a UPC-type connector typically would be blue while APC connector would have a green color.


**Bidirectional**: a fiber transceiver equipped with the capability to transmit and receive signals over a single fiber strand



## Fire Rating

### PVC
- Has no significant fire protection
- will create lots of smoke and fumes when burned

### Plenum
- Creates much less smoke when burned
- Costs 3-5x as much as PVC
- Many ordinances require plenum
- named after the space above a ceiling

### Riser
- not as good as plenum when it comes to fire protection
- named after the vertical spaces between floors in a building




## Ethernet
### Straight-through
AKA: Patch cable
Used to connect a host to a network device like a switch or hub

### Crossover
A crossover cable reverses the sending and receiving cables on one end of the cable.
Used to connect two hosts, since one the recieved signal on one host is the sent signal on the other host.
One end is wired according to 568A and the other according to 568B.
Modern switches auto detect and switch which wires are send and which wires are recieve, so this is a somewhat dated convention.

### Auto MDI-X
Automatically detects whether the required connection type is straight-through or crossover.
