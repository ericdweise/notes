ntp

# Network Time Protocol (NTP)

Devices are configured to update their clocks from a centralized server.
There are many public NPT servers, but these may also be configured by any 


## Communication with NTP Servers




## Stratums
NTP servers are identified by their stratum.
A stratum 0 device is the highest order.
It does not *get* its time from any other clock but is a standalone device.
Once it is set that is it.
Examples of stratum 0 devices are the clocks on GPS satelites.

An NTP server that synchronizes its time with a statum 0 server is called a stratum 1 device.
Similarly, a stratum 2 device synchronizes with a stratum 1 device, *und so weiter*.
The larger the stratum number, the less accurate the NTP server's clock will be, simply because errors can be introduced when each NTP server synchronizes it's clock.

The maximum stratum is 15.
A stratum of 16 indicates that the devices is unsynchronized