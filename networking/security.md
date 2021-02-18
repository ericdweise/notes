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


## Terminal Access Controller Access Control System Plus (TACAS+)
A method for distributing ACLs to many routers and switches.
The ACL is stored on a single server.
It communicates

### Kerberos
This is decidedly _not_ a point-to-point protocol.
Kerberos still runs on TCP/IP, but every host connects to a single authentication server, called the Key Distribution Center (KDC).
This KDC contains the usernames and passwords of all the users on the network.
When a user tries to log in to a host, that host queries the authentication server.
IF the authentication passes the user is sent a _Ticket to Request Ticket_.
This ticket expires after a certain time, after which the user must reauthenticate.
The ticket can be used to authenticate the user to access any other network resource that they are allowed to access during the ticket's lifetime.

Fun fact, Kerberos is the three headed dog from Ancient Greek mythology.





## Passwords
- Should be changed periodically (monthly)
- Should not be allowed to repeate passwords (within a year)
- Should be complex:
    - At least 8 characters
    - Upper and lower case letters
    - numbers
    - Special characters (like !, @, #, etc.)
