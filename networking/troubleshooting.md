troubleshooting

# Troubleshooting


## Troubleshooting Steps
CompTIA’s Network+ troubleshooting model includes eight steps:

1. Identify the exact issue.
2. Re-create the problem.
3. Isolate the cause.
4. Create an action plan.
5. Implement the correction.
6. Test the solution.
7. Document the cause and solution.
8. Give feedback.





## Broken Cables
There are many things that can cause a broken cable:

- Wire Break: One of the wires inside of the cable is physically broken.
- Bad Connection: The cable terminal doesn't make contact with the target device.
- Wires are shorted: Two wires in the cable are touching causing a sort circuit.
- Bad mapping: The wires might not connect to the correct terminals on each end of the cable.
- Impedance Mismatch: Connecting different cables with different impedances might cause strange electron flows.
- Wire Crosstalk: cable pairs interfere with each other





## Tools
### Cable Tester
These can test wire breaks, short circuits, bad connections, and bad mappings.
They come with two parts, plugging in to opposite ends of the cable in question.

### Time Domain Reflectometer
Send 

### Certifier
Used to test whether or not a wire can handle the data flow rate it is rated to.
It a wire is not broken but does not work properly.
These are used to diagnose crosstalk, high impedence, and interference.
These come in two parts, one goes on each end of the cable in question.

### Light Meter
Used to check how transparent an optical cable is.
Comes in two parts, one light emiter and one detector.

### Tone Probe and Generator
Used to identify the terminus of a cable.
The tone generator plugs into the known end of the cable (usually a drop) and the probe is used to determine which of a number of cables is the other end of the cable.
When both ends are plugged into the same cable the probe will emit a sound.





## Software
### arping
Uses ARP packets to request a response from another device.
These cannot be used with targets outside of the broadcast domain.

### ping
Uses ICMP packets to request a response from another device.
These might be blocked if the target is configured to drop ICMP packets.

### dig
Used to query a DNS record from a DNS server.

### nmap
A terminal based port scanner.

### route
Show your device's routing table.

### ss (more powerful netstat)
Used to view which running processes have active connections.

### tcpdump
A terminal based packet sniffer.

### traceroute
This is a software tool that will discover all the routers between two devices.
It can use either UDP or ICMP on Linux.
If the ICMP packets do not work try UDP, which are less likely to be blocked by devices.
