# Ethernet


## IEEE 802.3
The standards set forth by IEEE 802.3 establish Medium Access Control over wired Ethernet. 
The relevant changes put forth by revisions of the 802.3 standards are:

### Ethernet deployment Standards
The standards are named in the form **xBASE-y** with the elements taking the following 

- **x** is the 	*bitrate* (confusingly, in GB or MB per second.)
- **BASE** stands for *BASEBAND* or *BROADBAND*. All ethernet is transmitted using Baseband.
- **y** is the transmission type. This indicates the cable medium. Usually this is "T" for twisted copper.

For the exam remember that the maximum transmission distances for 10GBASE-T over the following mediums:

|       |       |
|-------|-------|
| UTP   | 55 m  |
| F/UTP | 100 m |
| S/FTP | 100 m |

- Ethernet standards are backwards compatible
- 





## Medium Access Control (MAC) Address
A 6 byte address that is assigned to a physical communication device.
Every device is assigned a unique MAC address.
These are usually represented in hexadecimal format:

`11:22:33:44:55:66`

The first 3 bytes are the **Organizationally Unique Identifier (OUI)**, a code assigned to a unique manufacturer.
The last three bytes are the **Network Interface Controller Specific**, or serial number, of the devices.





## The Ethernet Frame
The Ethernet Frame encapsulates the information needed by layer 2 of the OSI Model.
It will tell us the 
The form of an Ethernet Frame is:

`[ Preamble | SFD | Destination MAC | Source MAC | Type | Payload | FCS ]`

Each of the sections are described below:


### Preamble
This indicates that the following message is an Ethernet Frame.
It is always 7 bytes of alternating `1` and `0`:

```
1010101010101010101010101010101010101010101010
```


### SFD - Start Frame Delimiter
Another static set of data, this time it is one byte in a specific order:

```
10101011
```


### Destination and Source MAC
Each are 6 bytes long and give the MAC address of the physical devices sending and receiving the frame.


### Type
2 Bytes of data.
Indicates whether the data is IPv4 or IPv6.

TODO: list kinds of payload data



### Payload
46-1500 bytes. 
This is commonly TCP or UDP data.
If the payload contains less than 46 bytes then a PAD section is added.


### FCS - Frame Check Sequence
A **CRC** checksum that is 4 bytes long and is calculated for all of the data in frame.
The CRC does not allow for retransmission, and does not catch all errors.
If the frame does not agree with it's CRC then the frame is dropped.






## Network Communications

### Half Duplex
This is an old format of transporting data in a network.
Data can be sent both to and from a HUB, but only one direction can be sent at a time.
A devices cannot send data when the HUB is sending data (to all devices).
If 

### Full Duplex / Switch Network
A switch does full duplex communication

#### Spanning Tree Table
A switch will keep a table of MAC addresses listing all the devices on the network.
This table is built from the **Source MAC** parts of the Ethernet Frames sent to it.

#### Flooding
When a destination MAC address is not in the STT it will flood the network with that frame.
If a device on the 

#### Address Resolution Protocol
A protocol that a network device can use to find MAC addresses of the other devices on a network.
It is used to pair IP addresses with MAC addresses, and can be run for a specific IP address or can be used to flood the network and get all the MAC addresses.

Querying your local ARP Cache: `arp -a`


### Wireless Networks
Wireless networks use a **Ready to send, Clear to send** protocol.
When a devices is ready to send data to the base station it requests a time slot in which to broadcast.
This is the ready to send signal.
The base station then queues the request.
When the base station is ready to receive the data from that device it will send the device a signal allowing it to broadcast its payload.

This rigmarole is necessary because devices physically cannot send and receive data at the same time.
This is because sending data overrides the antenna's ability to listen.
Furthermore, on a specific communication band, if two devices are broadcasting at the same time, their signals will interfere with each other.


### Bus Ethernet
In a bus network, every ethernet frame is sent to every host.
Each host determines whether or not the frame is directed to it and discards the frame if the destination MAC address does not match the device's.


### NBaseX
- N is the speed (in Mbps)
- Base indicates baseband (one signal, as opposed to broadband)
- X indicates cable type:
    - T means twisted copper wire
    - FL means Fiber Optic


|            | Cable      | Max Dist* |
|------------|------------|-----------|
| 10BaseT    | CAT 3      | 100 m     |
| 10BaseFL   | MMF        | 2 km      |
| 100BaseT   | CAT 5      | 100 m     |
| 1000BaseT  | CAT 5e / 6 | 100 m     |
| 1000BaseSX | MMF        | 220-500 m |
| 1000BaseLX | SMF        | 5 km      |
| 10GBaseT   | CAT 6a     | 100 m     |

- Some questions will ask for distances of sub-optimal cables. See [Cables](./cables.html) for more on this.


#### 100 Base 
- Also called vast ethernet

#### 1000 Base T
- IEEE 802.3ab
- most common ethernet nowadays

#### 1000 Base SX / LX
- IEEE 802.3z
- optical
- 

#### 10G Base (10 GbE)
Standard names take the form 10GBaseXY, where X,Y have the following meanings:

| X | means            | Wavelength | Max Cable Length |
|---|------------------|------------|------------------|
| S | Short wavelength | 850 nm     | 26-300 m         |
| L | Long wavelength  | 1320 nm    | 10 km            |
| E | Extra-long wave  | 1550 nm    | 40 km            |

| Y | means | Use       |
|---|-------|-----------|
| R | local | LAN       |
| W | WAN   | WAN/SONET |

#### Half Duplex
- Can only send or recieve data at one time
- 10BaseT and early 100BaseT were half-duplex


#### Synchronized Optical Networok (SONET)
- Existed before 10GBase ethernet
- Used in WANs
- Adopted by IEEE 802.3 working group as the 10GBase*W standards




## Carrier Sense Multiple Access and Collision Detection (CSMA/CD)
This is a protocol that allows multiple hosts to access a bus network.
Bus networks create what's called a collision domain.

### Multiple Access
Every host has the same access to the network.

### Carrier Sense
Every host examines the network before sending a data frame, sending data only when the network is not in use.

### Collision Detection
When two hosts send data at the same time both frames are lost (a collision).
Both NICs on the hosts will detect that the other host is sending data and stop transmission.
After a random time the NIC will retransmit the frame.





## Spanning Tree Protocol
If two or more switches are connected in a loop this can cause problems.
A frame could be transmitted through the loop infinitely and bring down the entire network
Spanning Tree Protocol solves this issue.

- One switch is randomly elected to be the "root switch"
- every other switch finds a path to the root switch using Bridge Protocol Data Units (BDPU)
- Ports connected to switches not on the path to the are put into the "blocking state", and are unable to send or recieve normal frames

Of course, the topology needs to change 
Blocked ports can listen for a Topology Change Notification BDPU.
In the case of a switch being taken out of the network then the rest of the switches will recreate the spanning tree with a newly elected root switch.
