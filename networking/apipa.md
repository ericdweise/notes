# Automatic Private IP Addressing (APIPA)
- Also called **zeroconf**
- A fallback when there is no DHCP server
- Allows computers on a LAN to communicate
- Network Address is `169.124.0.0/16`
- Clients will randomly choose the final two octets
- If the randomly chosen octets are already taken then another two are generated
- No default gateway, and therefor

