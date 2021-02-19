# Types of Network Attacks



### Virus
A self replicating and spreading exploit.

### Logic Bomb
An exploit that is set off when certain conditions are met.

### Rootkit

### Trojan Horse

### Man in the Middle (MITM)
An actor placed inbetween two devices.
This listens to all communications between these devices.
It can also modify unencrypted or cracked data before it forwards the data on to the recipient.

### Evil Twin
A rogue WAP set up with the same SSID as another.
This rogue WAP will intercept traffic, acting as a man in the middle.

### War Driving
Driving in a car with specialized hardware ("specialized" in the old days) to find open WAPs.

### Phishing
Posing as a legitimate service in order to trick a user into giving out sensitive information.

### Ransomeware
Locking or encrypting data and holding it hostage for payment.

### DNS Poisoning
Remapping a domain name to a rogue IP address.
This allows a threat actor to impersonate a known service or device.
Then the actor can send malicious data or intercept sensitive data.

### ARP Poisoning
A device impersonates the default gateway by associating it's MAC address with the deault gateway's IP address.
It sends out rogue ARP broadcasts that hosts on the network put into their ARP tables.

### Denial of Service (DoS)
Overwhelming a server with so much traffic that it stops working or shuts down.
This is common with HTTP servers but can work on any device.
There are some 

#### Distributed DoS (DDoS)
Using many different hosts with many different IP addresses to perform a DoS attack.
This is harder to block than a regular DoS attack because it is harder to determine which IP addresses are legitimate and which are malicious.
Usually the attacking machines are compromised and owned by people other than the attacker.

#### Reflective DoS
Using a third party service to send a DoS attack.


### Downgrade Attack


### Brute Force
Repeatedly testing different passwords in order to log into a service or break encryption cipher.

#### Dictionary attack
A type of brute force attack that uses a list (dictionary) of commonly used passwords.

### Wireless Disassociation Attack
WiFi management frames are sent unencrypted.
This allows the attacker to view another device's MAC address.
The attacker sends disassociation frames to the WAP with the target device's MAC address.
This boots the target device off the wireless network.
These frames are usually sent continuously, making it a DoS attack.

### VLAN Hopping
A family of attacks used by a device to get access to a retricted VLAN.

#### Switch Spoofing
The attacker imitates a trunking switch, thus being able to gain access to the VLANs managed by the switch the attacker is connected to.

#### Double Tagging
The attacking device sends a frame with two VLAN tags.
The first switch strips the outer tag and forwards the frame to another switch with the second tag is visible.
The second switch then forwards the frame to a device on the network on the restricted VLAN.
