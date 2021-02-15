# Simple Network Management Protocol (SNMP)

For more information see [DigitalOcean's page](https://www.digitalocean.com/community/tutorials/an-introduction-to-snmp-simple-network-management-protocol)

Running SNMP creates a "managed network."

A **Network Management System** is software that runs the SNMP.
This software runs on a device and can use SNMP to monitor and control other devices on the network.
The devices under management are called agents.


## Network Management System (NMS)
### Core Functions

| Message   | Direction        | Action                                                                     |
|-----------|------------------|----------------------------------------------------------------------------|
| Get       | manager -> agent | request a specific property from the agent                                 |
| GetNext   | manager -> MIB   | Get the next sequential object in the MIB                                  |
| GetBulk   | manager -> agent | fill as many properties will fit in the response                           |
| Inform    | manager -> agent | inform reciept of trap                                                     |
| Response  | agent -> manager | send info in response to any message from the manager, including an inform |
| Set       | manager -> agent | set a specified property                                                   |
| Trap      | agent -> manager | asynchronous update                                                        |


## Management Information Base (MIB)
This is a device on a managed network that collect data for later review.
