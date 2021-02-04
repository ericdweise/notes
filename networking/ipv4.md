ipv4

# Internet Protocol version 4


IPv4 is a pervasive but dying protocol.
In fact, it is planned to end of life on [February 1, 2021](https://ipv4flagday.net/).
However, at least for now, it remains the standard for network address assignment.



### Subnet Mask
used by the device to determine what subnet it belongs to.
This determines what devices the device can send data to.
The mask tells you how many bits in the IP address must agree (counting from the left) for the address to be accessible.
For example, if a device has an IP address of `10.10.10.10` and it's subnet mask is `255.255.255.0`, then the first three octets must agree.
So, any address in `10.10.10.0` and `10.10.10.255` are reachable, but `10.10.11.0` is not.

By convention, a subnet mask must have a binary form with all `1`s on the left and all `0`s on the right.
This is because we always mask the most significant bits first.
For example, `255.224.0.0` has the binary form `11111111.11100000.00000000.00000000` and is a valid submask.

`255.36.0.0` has the binary form `11111111.00100100.00000000.00000000` is not valid because the `1`s are not left aligned.

As a general rule, each octet of the subnet mask must take a value in `255`, `254`, `252`, `248`, `240`, `224`, `192`, `128`, and `0`.


#### Examples of Accessible Addresses
| IP Address    | Subnet Mask       | Communicable addresses             |
|---------------|-------------------|------------------------------------|
| `192.168.1.1` | `0.0.0.0`         | Every IP address*                  |
| `192.168.1.1` | `255.255.255.255` | `192.168.1.1`                      |
| `192.168.1.1` | `255.255.255.0`   | `192.168.1.0` to `192.168.1.255`   |
| `192.168.1.1` | `240.0.0.0`       | `192.0.0.0` to `207.255.255.255`** |
| `192.168.1.1` | `248.0.0.0`       | `192.0.0.0` to `199.255.255.255`** |

\* In reality, every address is not reachable because of the reserved private ranges (see below).
\** This is a bit tricky to see. But if you work it out in binary form the result becomes clear.


#### Connection to CIDR
It is useful to look at the binary representation of the subnet mask:
`255.255.240.0` = `11111111.11111111.11110000`.
In this representation it is easy to see that the first 20 bits of the address are masked.
Therefore, in CIDR notation this is a `/20` mask.


### Default Gateway
The IP address that the router uses to talk to devices inside the **intranet**.
If the device needs to communicate with a device outside of the subnet, it will need to send the data first to the default gateway, and the router will forward this data.




## Classful Address
In the beginning of networking 
These classes are too rigid, and they aren't enforced any more, but it is useful to know them.
Most networks still default to these values.

| Class   | Lead Bits | Lowest Addr. | Highest Addr.     | Number of Addresses       |
|---------|-----------|--------------|-------------------|---------------------------|
| Class A | `0...`    | `0.0.0.0`    | `127.255.255.255` | $2^{31}$, `2,147,483,648` |
| Class B | `10..`    | `128.0.0.0`  | `191.255.255.255` | $2^{30}$, `1,073,741,824` |
| Class C | `110.`    | `192.0.0.0`  | `223.255.255.255` | $2^{29}$, `536,870,912`   |
| Class D | `1110`    | `224.0.0.0`  | `239.255.255.255` | $2^{28}$, `268,435,456`   |
| Class E | `1111`    | `240.0.0.0`  | `255.255.255.255` | $2^{28}$, `268,435,456`   |

### Classes D and E
Classes D and E are not available for public use.
Class D addresses are reserved for multicasting and are not assigned to hosts.
Class E address are reserved for research and experimental purposes.

### Classful Addresses in Binary Form
It is useful to think of this in binary form too:

| Class | Lowest Binary Address                 | Highest Binary Address                |
|-------|---------------------------------------|---------------------------------------|
| A     | `00000000.00000000.00000000.00000000` | `01111111.11111111.11111111.11111111` |
| B     | `10000000.00000000.00000000.00000000` | `10111111.11111111.11111111.11111111` |
| C     | `11000000.00000000.00000000.00000000` | `11011111.11111111.11111111.11111111` |
| D     | `11100000.00000000.00000000.00000000` | `11101111.11111111.11111111.11111111` |
| E     | `11110000.00000000.00000000.00000000` | `11111111.11111111.11111111.11111111` |




## Classless Inter-Domain Routing

TODO: 	VLSM


### Reserved Private Ranges
A list of IP addresses reserved for private networks.
These cannot be used for any public facing devices, i.e. any devices exposed directly to the internet.


| Class Name    | Address Range                     | CIDR Block       | Default Subnet Mask |
|---------------|-----------------------------------|------------------|---------------------|
| Class A       | `10.0.0.0` - `10.255.255.255`     | `10.0.0.0/8`     | `255.0.0.0`         |
| Class B       | `172.16.0.0` - `172.31.255.255`   | `172.16.0.0/12`  | `255.255.0.0`       |
| Class C       | `192.168.0.0` - `192.168.255.255` | `192.168.0.0/16` | `255.255.255.0`     |
| Loopback      | `127.0.0.0` - `127.255.255.255`   | `127.0.0.0/8`    | N/A                 |
| APIPA/Boujour | `169.254.0.0` - `169.254.255.255` | `169.254.0.0/16` | N/A                 |


#### Loopback Range
A list of addresses reserved for a device to talk to itself.
Usually only one loopback interface is needed on a device, but more loopback interfaces can be created if necessary.
Any address between `127.0.0.0` and `127.255.255.255` can be used as a loopback address.

#### ZeroConf Range




## Quick Maths
