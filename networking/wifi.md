wireless-comm

# Wireless Communication Protocols


## 802.11 - WiFi

| Revision              | 1997      | A         | B         | G\*       | N\*\*     | AC        |
|-----------------------|-----------|-----------|-----------|-----------|-----------|-----------|
| Year Adopted          |           | 1999      | 1999      | 2003      | 2009      |           |
| Max Throughput (Mbps) | 2         | 54        | 11        | 54        | 300       | 6.77 Gbps |
| Frequency (GHz)       | 2.4       | 5         | 2.4       | 2.4       | 2.4 and 5 | 5         |
| Range (feet)          | ~300      | ~150      | ~300      | ~300      | ~300      | ~300      |
| Modulation            | DSSS      | OFDM      | DSSS      | OFDM      | OFDM      |           |
| Channels              |           |           |           |           |           |           |
| Channel Width (MHz)   |           | 20        | 22        | 20        | 40        | 80 or 160 |
| CSMA/CA               |           | &#10004;  |           | &#10004;  | &#10004;  | &#10004;  |
| MIMO                  |           |           |           |           | &#10004;  |           |
| MU-MIMO               |           |           |           |           |           | &#10004;  |

\* 802.11g has a _mixed mode_ allowing it to drop datarates to 11 Mbps and support DSSS when an 802.11b device joined the network.
\*\* 802.11n supports b and n devices using mixed or legacy modes. If only n devices are connected then it runs in greenfield mode.


### Wireless Access Point (WAP)
Works like an OSI Level 1 hub, but often incorporates other responsibilities like switching and routing.
If the WAP is a gateway then it probably also has a DHCP server and NAT service.

### Independent Basic Service Set
- A.k.a **peer-to-peer mode** or **Ad-Hoc**.
- No WAP, therefore cannot connect to other networks.
- Wireless hosts can connect directly to one another and route data between hosts.
- These networks can be used for small numbers of computers.
- The **Independent Basic Service Set ID (IBSSID)** is is a randomly generated, 48-bit number that functions like a MAC Address.

### Infrastructure Mode
- Nodes must communicate through Wireless Access Points (WAPs), like routers in ethernet.
- Create a Wireless Local Area Network (WLAN)
- Two types, BSS and ESS (see below)

### Basic Service Set (BSS)
- A WiFi network with only one WAP.
- The **Basic Service Set Identifier (BSSID)** is the MAC Address of the WAP

### Extended Service Set (ESS)
- A WiFi Network with more than one WAP
- **Extended Service Set ID (ESSID)** is generated and shared among all the WAPs
- All WAPs share the network SSID too

### Service Set Identifier (SSID)
This is a common name (not a 48 bit number) for a network.
It is the human-readable network identifier, and it does not replace the BSSID or ESSID.
The purpose of the SSID is for humans to configure the connection to the network.
All hosts must have the same SSID to connect to each other in a WiFi network.
The WAP will continuously broadcast the SSID so that hosts know they are connecting to the correct network.





## Carrier Sense Multiple Access / Collision Avoidance (CSMA/CA)
Unlike in wired networks, Collision Detection is not possible.
This is because wireless antenae cannot listen and send data simultaneously.
Therefore, collisions can't be detected.
Instead, wireless networks need to avoid them.
If a collision happens it is up to higher level applications (like TCP) to detect and remediate the issue.

### Distributed Coordination Function (DCF)
Before a host can transmit data it must check to see if the radio frequency is already being used.
If some other host is transmitting the host will wait for a backoff period and try again after.
After transmission, a recieving host must send an ACK.
The sender will continue to retransmit until the ACK is sent or the message times out.

1. 

### Point Coordination Function (PCF)
A collision avoindance scheme that is no longer in use.

### Ready to Send / Clear to Send (RTS/CTS)

### Multiple Input / Multiple Output (MIMO)
This is a standard introduced in 802.11n.
It requires devices to have multiple antenae that can simultaneously connect to different channels

### Multiple User Multiple Input / Multiple Output (MU-MIMO)
Implemented in 802.11ac.
This allows different antennae to broadcast to different users simultaneously using different frequencies.

### VLAN Pooling
The process of breaking BSS or ESS into smaller VLANs.
Hosts are randomly assigned to one of these VLANs.
This decreases the number of devices in a broadcast domain.





## Modulation Techniques
### Direct Sequence Spread Spectrum (DSSS)
A kind of code division multiple access.
It sends data out on several frequencies simultaneously.
Has better datarate than FHSS

### Frequency Hopping Spread Spectrum
This only sends one frequency at a time, but hops between frequencies.
Has less interference than DSSS.

### Orthogonal Frequency Division Multiplexing (OFDM)
Different sub-channels are used to carry different signals.
These sub-channels are chosen so that they are orthogonal to eachother.
The orthogonality also allows high data thoughput, approaching the Nyquist rate.








## Miscellaneous

### Channel bonding
A technique that allows for combining adjacent channels to increase the amount of available bandwidth





## WiFi Security
Methods for encrypting communication on a network.
In general, remember that WPA is good but WPS and WEP should be avoided.

### WiFi Protected Security (WPS)
This is a relatively insecure method for securing a network.
There are two methods for authenticating a new host:

#### Push Button
A button is pushed on the WAP, then a button is pushed on the host.
Configuration happens automatically.
Downside is that you need physical access to the WAP, or a device already connected to the WLAN.

#### Pin Method
First a button is pressed on the WAP.
Then, a preconfigured, 8-digit Personal Shared Key is entered into the host.


### Extensible Authentication Protocol
A RADIUS server is set up and WAPs act as edge Network Access Servers (NASs).
EAP is a set of different protocols used to secure PPP authentication.
They are different encryption protocols so that the user-name and password are not transmitted in the clear.
The include:
- EAP-PSK (Pre-Shared Key)
- EAP-TLS
- EAP-TTLS (Tunneled TLS)
- EAP-MS-CHAPv2
- EAP-MD5
- LEAP (cisco)
- EAP-Fast (cisco)


### Wireless Equivalence Privacy (WEP)
An easily cracked and no longer used standard.
Has a static encryption key and a stream cipher that decreases key length.
Also doesn't provide user authentication

### WiFi Protected Access (WPA)
Introduced Temporal Key Integrity Protocol, an 128 encryption key.
Turned out to be just as insecure as WEP.
Quickly abandoned

### WPA2
Uses Counter Mode Cipher Block Chaining Message Authentication Code Protocol (CCMP), an AES block cipher, and a 128 bit encryption key.
Currently the standard for WiFi security.
The simplest version uses a pre-shared key, but this doesn't do any user authentication.

### WPA2-Enterprise
