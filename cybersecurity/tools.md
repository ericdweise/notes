A quick list of tools



### netcat
Read and write data across network connections using TCP or UDP protocols.

```bash
netcat IP PORT MESSAGE
```



### nmap
Network exploration tool and security / port scanner.

```bash
nmap -sP SUBNET/MASK
```



### tcpdump
Capture and save TCP and UDP data on a network.

```bash
sudo tcpdump -D
```

Filters:

- `host` filter by host ip address or hostname
- `src` filter by senders ip address or hostname
- `dst` filter by receivers ip address or hostname

Filters can be combined using `and`/`or`.



### telnet
Used for interactive communication between using the TELNET protocol.
