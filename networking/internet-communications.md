internet-communications



## Domain Name System (DNS)

A server that hosts a website has to communicate using only IP addresses.
DNS is how someone wishing to access the web content converts the website's domain name, e.g. `www.ericdweise.com`.
Gaining the IP address for the server hosting the website from a DNS server is called **resolving**.

DNS is a very distributed database.
There are many servers that can resolve IP addresses.
Usually a device is configured to connect to a **root server** which can direct your request to other servers.

Some common name servers are:
| Server Name | Primary DNS      | Secondary DNS     |
|-------------|------------------|-------------------|
| Google      | `8.8.8.8`        | `8.8.4.4`         |
| Cloudflare  | `1.1.1.1`        | `1.0.0.1`         |
| Quad9       | `9.9.9.9`        | `149.112.112.112` |
| OpenDNS     | `208.67.222.222` | `208.67.220.220`  |
| SafeDNS     | `195.46.39.39`   | `195.46.39.40`    |
| Level3      | `209.244.0.3`    | `209.244.0.4`     |
| DNS WATCH   | `84.200.69.80`   | `84.200.70.40`    |





## Zones

### Forward Lookup Zone
Given an FQND, the Forward lookup zone will provide an IP address for the host serving that site.
### Reverse Lookup Zone
Given an IP address, the reverse lookup zone will provide a FQDN.

### Primary and Secondary Zones
Primary zone is the first place to look for a record.
Secondary zone takes over if the primary is down, but cannot add new records.
The secondary zone will receive updates from the primary.





## DNS Records
A DNS Server keeps a large list of IP addresses connected to their domain name.
this is just a text file.


### DNS Record Types
There are over 30 types of DNS records.
This list will go over some of the most common ones.

NOTE: the semi-colon, `;`, is the comment symbol.

#### Start of Authority (SOA)
An SOA record points at a server that is in charge of a forward lookup zone.


#### Name Server (NS)
This points at the name server for a particular domain


#### Address Records: A and AAAA records

- **A Records** are used for IPv4 addresses
- **AAAA Records** are used for IPv6 addresses

An example A record is

```
example.com    IN A    123:45:67:89
```


#### Canonical Name Record: CNAME
A CNAME record is used to associate several domain names with one device, i.e: one IP address.
The first domain name will be set up as an A or AAAA record, but any subsequent domains will alias 

If we wanted to add the `www`, `mail`, and `ftp` subdomains to the `example.com` and want these to live on the same physical server (i.e. share the same IP address) as `example.com`, then the CNAME record would look like this:

```
; Alias (canonical) names
    www IN CNAME example.com.
	ftp IN CNAME example.com.
	mail IN CNAME example.com.
```


#### Service Records (SRV)
These records are used to find particular services on a network.
Examples of Services that might need a SRV record might be a VoIP controller, or an instant messaging server.

An example of a SRV record directing to a network's Microsoft Active Directory Controller is shown below.

```
; Service records
; _service._proto.name. TTL class SRV priority weight port target
 _ldap._tcp.domain.com. 300 IN    SRV 10       60     389  s1.domain.com.
 ```
 
 
 #### Mail Exchange Record: MX
 This is an additional record in the DNS file that specifies the domain name of the mail server.
 The server still needs to have an A Record (or CNAME record) in the file.
 
 ```
 IN MX mail.example.com
 ```
 
 
#### Pointer Records
These are reverse look up records.
They allow a user to find a domain name given an IP address.
They are added to the reverse map zone file.

```
123.45.67.89    IN    PTR   example.com.
```


#### Text Records
These are not records, per se, but they offer useful information.
They include things like:
- Sender Policy Framework (SPF), which authorize an external host to send mail from a given domain
- Domain Keys Identified Mail (DKIM), are public key parts of a digital signing framework so that a mail recipient can verify that the mail came from the private key holder.
