# Access Control List (ACL)
At a high level, an Access Control List is just a set of rules determine which resources a user can access.
ACLs usually are set up to run on routers.
They can act on many things, like:
- source/destination IP address
- time of day
- port number
- application
- protocol

Most rules have an implicit deny, so that any traffic not allowed by a previous rules in the list are denied by default



## Types of ACLs

### Mandatory Access Control
Every resource is given a security level.
If a user does not have that level of security then 
This is a very linear system.
When a user with a certain secirity clearance will have access to everything at that level and lower.

### Discretionary Access Control
Every resource is assigned an owner.
The owner of the resource can allow a particular user to access the resource.

### Role Based Access Control
Role Based Access Control uses the abstraction of groups.
A group is given access to certain resources.
Users can be added to a group.
When a user is added to a group they are granted access to the resources the group has access to.
