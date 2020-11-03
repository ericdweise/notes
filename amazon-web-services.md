# Amazon Web Services

## Create a Webserver

### Create VPC
1. Use Following parameters:
 * Name: open-to-web
 * CIDR Block 10.0.0.0/24 
2. Enable "DNS resolution"
3. Enable "DNS hostnames"

### Create Subnet
For this simple webserver I will only use one subnet and it will be public. Create it with the following parameters:
* Name: open-to-web
* VPC: open-to-web
* CIDR Block: 10.0.0.0/28

### Create Security Groups
Create two security groups within EC2. They should be the following:

#### Security Group to allow web traffic
Security Group Configuration:
* Security group name: "http-https-from-everywhere"
* Description: "Allow http and https requests from everywhere"
* VPC: "open-to-web"
Add Rule for HTTP:
* Type: "HTTP"
* Source: "Anywhere"
* Description: "allow incoming http requests"
Add Rule for HTTPS
* Type: "HTTPS"
* Source: "Anywhere"
* Description: "allow incoming https requests"

#### Security Group to allow SSH to server
This group will allow you to ssh from home. It should only be attached to the instance once while provisioning or maintenance the instance.
Security Group Configuration:
* Security group name: "ssh-from-home"
* Description: "ssh from home"
* VPC: "open-to-web"
Add Rule for SSH. This rule can (and should) be suspended when not provisioning the webserver
* Type: "SSH"
* Source: "My IP"
* Description: "allow ssh from home"

### Create Internet Gateway
* Name tag: open-to-web
Then, attach the IGW to the VPC "open-to-web"

### Route Tables
Edit the route table created when you created the VPC. It should be the only one associated with the VPC "open-to-web". Add a route with the following parameters:
* Destination: 0.0.0.0/0
* Target: Internet gateway "open-to-web"

### Launch Instance
Create an instance. You will provision it later

### Elastic IP Address
Create a new EIP and associate it to the instance.
