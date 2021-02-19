# Authentication Protocols



## Point to Point Protocol (PPP)
An early protocol used in dial-up communications
The drawback of PPP is that every possible modem must know every possible client.

### Password Authentication Protocol (PAP)
Very insecure way to authenticate users using PPP.
Username and password are transmitted in cleartext.

### Challenge Handshake Authentication Protocol (CHAP)
Passwords are never sent across the connection.
Instead, a pre-shared key is used to generate an authentication challenge.
This challenge is performed when the connection is initiated and periodically thereafter.

### MS-CHAP
Much more secure, and still in use today.
Communications are fully encrypted.


## Authentication, Authorization, and Accounting (AAA)
AAA is a model in which a central server that keeps authentication information.
Therefore, any modem can be connected to by any client.
When the connection request comes in the modem just checks with the authentication server before allowing the connection.

### Remote Authentication Dial-In User Service (RADIUS)
An AAA standard.
This protocol uses many Network Access Servers, which users connect to.
There is also a centralized RADIUS server, which contains a database of user authentication credentials.
All the NASs connect to the RADIUS server to get authentication credentials.

Key Facts:
- Used to grant network access
- Authentication and Authorization are combined into the same process
- Only encrypts the password in the authentication payload


## Terminal Access Controller Access Control System Plus (TACACS+)
A method for distributing ACLs to many routers and switches.
The ACL is stored on a single server.
It communicates

Key Facts:
- TACAS was an open protocol. TACACS+ was developed by Cisco to replace TACAS and solve many of its failings
- TACACS+ encrypts the entire authentication payload, not just the user's password
- Used mostly for device administration
- Authentication and Authorization are separate processes


### Kerberos
This is decidedly _not_ a point-to-point protocol.
Kerberos still runs on TCP/IP, but every host connects to a single authentication server, called the Key Distribution Center (KDC).
This KDC contains the usernames and passwords of all the users on the network.
When a user tries to log in to a host, that host queries the authentication server.
IF the authentication passes the user is sent a _Ticket to Request Ticket_.
This ticket expires after a certain time, after which the user must reauthenticate.
The ticket can be used to authenticate the user to access any other network resource that they are allowed to access during the ticket's lifetime.

Key Facts:
- Reduces efficacy of replay attacks
- Encrypted keys are called tickets

Fun fact, Kerberos is the three headed dog from Ancient Greek mythology.





## DHCP Snooping
A set of features added to a DHCP server that address some common security failures.
Although DHCP operates on OSI level 3, DHCP Snooping operates on a switch, providing integrity between IP addresses and MAC addresses.
Some protections provided are:

- ARP sanitization
- IP Address Integrity
- Physical IP Address tracking





## User Agreements
Some forms that users might need to sign before accessing network resources:
- AUP: Acceptable Use Policy
- NDA: Non Disclosure Agreement





## Passwords
- Should be changed periodically (monthly)
- Should not be allowed to repeate passwords (within a year)
- Should be complex:
    - At least 8 characters
    - Upper and lower case letters
    - numbers
    - Special characters (like !, @, #, etc.)





## Online Certificate Status Protocol (OCSP)
Used to verify the revocation status of a certificate.
