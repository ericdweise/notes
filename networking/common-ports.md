# Common Ports

| On Exam  | Port(s)     | Service            | Notes
|----------|-------------|--------------------|----------------------------------
| &#10003; | `tcp 20`    | FTP (active)       |
| &#10003; | `tcp 21`    | FTP (control)      |
| &#10003; | `tcp 22`    | SSH                |
| &#10003; | `tcp 22`    | SFTP               | FTP using SSH tunnel
| &#10003; | `tcp 23`    | TELNET             |
| &#10003; | `tcp 25`    | SMTP               |
|          | `tcp 49`    | TACAS+             |
| &#10003; | `tcp 80`    | HTTP               |
|          | `tcp 88`    | Kerberos           |
| &#10003; | `tcp 110`   | POP3               |
|          | `tcp 137`   | NetBIOS            |
| &#10003; | `tcp 143`   | IMAP4              |
| &#10003; | `tcp 389`   | LDAP               |
| &#10003; | `tcp 443`   | HTTPS              |
| &#10003; | `tcp 445`   | SMB / CIFS         |
| &#10003; | `tcp 636`   | LDAPS              | No longer supported
|          | `tcp 989`   | FTPS (active)      | FTP over SSL
|          | `tcp 990`   | FTPS (control)     | FTP over SSL
| &#10003; | `tcp 1720`  | H.323              | Video Presentation Codec
| &#10003; | `tcp 3389`  | RDP                |
|          | `tcp 5004`  | RTP                | VoIP
|          | `tcp 5005`  | RTP                | VoIP
| &#10003; | `tcp 5060`  | SIP                |
| &#10003; | `tcp 5061`  | SIP                |
| &#10003; | `udp 53`    | DNS                |
| &#10003; | `udp 67`    | DHCP (server)      |
| &#10003; | `udp 68`    | DHCP (client)      |
| &#10003; | `udp 69`    | TFTP               | No security, whatsoever
| &#10003; | `udp 123`   | NTP                |
|          | `udp 138`   | NetBIOS Datagram   |
| &#10003; | `udp 161`   | SNMP agent         |
|          | `udp 162`   | SNMP NMS           |
|          | `udp 389`   | LDAP               |
|          | `udp 10161` | SNMP agent         | TLS encrypted
|          | `udp 10162` | SNMP NMS           | TLS encrypted
