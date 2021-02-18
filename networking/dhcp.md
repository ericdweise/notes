# Dynamic Host Configuration Protocol (DHCP)




- Stopped at Router (not sent outside of network)
- Can use a DHCP helper to forward DHCP broadcast to unicast directed at external DHCP server.

### Steps in DHCP

|   |            |                  |           |
|---|------------|------------------|-----------|
| 1 | `DISCOVER` | client to server | Broadcast |
| 2 | `OFFER`    | server to client | Broadcast |
| 3 | `REQUEST`  | client to server | Boradcast |
| 4 | `ACCEPT`   | server to client | Unicast   |

