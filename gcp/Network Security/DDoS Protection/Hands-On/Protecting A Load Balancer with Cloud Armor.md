# Protecting A Load Balancer with Cloud Armor

- Google Cloud HTTP(S) load balancing is implemented at the edge of Google's network in Google's points of presence (POP) around the world. User traffic directed to an HTTP(S) load balancer enters the POP closest to the user and is then load balanced over Google's global network to the closest backend that has sufficient capacity available.

- Cloud Armor IP allowlist/denylist enable you to restrict or allow access to your HTTP(S) load balancer at the edge of the Google Cloud, as close as possible to the user and to malicious traffic. This prevents malicious users or traffic from consuming resources or entering your Virtual Private Cloud (VPC) networks.

## 1. Configure HTTP and health check firewall rules
Configure firewall rules to allow HTTP traffic to the backends and TCP traffic from the Google Cloud health checker.

### Create the HTTP firewall rule
Create a firewall rule to allow HTTP traffic to the backends.

1. In the Cloud console, navigate to Navigation menu (Navigation menu icon) > VPC network > Firewall.

2. ICMP, internal, RDP, and SSH firewall rules. Each Google Cloud project starts with the default network and these firewall rules.

3. Click Create Firewall Rule.

4. Set the following values, leave all other values at their defaults:

| Property            | Value                                      |
|---------------------|--------------------------------------------|
| Name                | default-allow-http                         |
| Network             | default                                    |
| Targets             | Specified target tags                      |
| Target tags         | http-server                                |
| Source filter       | IPv4 Ranges                                |
| Source IPv4 ranges | 0.0.0.0/0                                  |
| Protocols and ports | Specified protocols and ports, TCP, type: 80|

Make sure to include the /0 in the Source IPv4 ranges to specify all networks.

5. Click `Create`

## Create the health check firewall rules

- Health checks determine which instances of a load balancer can receive new connections. For HTTP load balancing, the health check probes to your load balanced instances come from addresses in the ranges 130.211.0.0/22 and 35.191.0.0/16. Your firewall rules must allow these connections.

1. In the Firewall page, click Create Firewall Rule.

2. Set the following values, leave all other values at their defaults:

| Property            | Value                                      |
|---------------------|--------------------------------------------|
| Name                | default-allow-health-check                 |
| Network             | default                                    |
| Targets             | Specified target tags                      |
| Target tags         | http-server                                |
| Source filter       | IPv4 Ranges                                |
| Source IPv4 ranges | 130.211.0.0/22, 35.191.0.0/16             |
| Protocols and ports | Specified protocols and ports, TCP         |

3. Click `Creata`


## 2. Configure instance templates and create instance groups
A managed instance group uses an instance template to create a group of identical instances. Use these to create the backends of the HTTP Load Balancer.

### Configure the instance templates
An instance template is an API resource that you use to create VM instances and managed instance groups. Instance templates define the machine type, boot disk image, subnet, labels, and other instance properties.

Create one instance template for Region 1 and one for Region 2 of your choice.

1. In the Cloud console, go to Navigation menu (Navigation menu icon) > Compute Engine > Instance templates, and then click Create instance template.

2. For Name, type Region 1-template.

3. For Series, select E2.

4. For Machine Type, select e2-micro.

5. Click Advanced Options.

6. Click Networking. Set the following value and leave all other values at their defaults:

| Property     | Value        |
|--------------|--------------|
| Network tags | http-server  |


7. Click default under Network interfaces. Set the following values and leave all other values at their defaults:

| Property     | Value               |
|--------------|---------------------|
| Network      | default             |
| Subnetwork   | default Region 1    |

Click Done

The network tag http-server ensures that the HTTP and Health Check firewall rules apply to these instances.

8. Click the Management tab.

9. Under Metadata, Add this script to the user data

```bash
#!/bin/bash

# Update package list
apt-get update

# Install Apache
apt-get install -y apache2

# Start Apache service
systemctl start apache2

# Enable Apache service to start on boot
systemctl enable apache2

# Create a sample HTML file
echo "<html><head><title>Hello, World!</title></head><body><h1>Hello, World!</h1></body></html>" > /var/www/html/index.html

# Set proper permissions for the HTML file
chown www-data:www-data /var/www/html/index.html
chmod 644 /var/www/html/index.html
```

11. Click `Create.`

12. Wait for the instance template to be created.

### Create another instance template for subnet-b by copying Region 1-template:

1. Click on Region 1-template and then click on the +CREATE SIMILAR option from the top.

2. For Name, type Region 2-template.

3. Click Advanced Options.

4. Click Networking.

5. Ensure http-server is added as a network tag.

6. In Network interfaces, for Subnetwork, select default (Region 2).

7. Click Done.

8. Click Create.

### Create the managed instance groups

Create a managed instance group in Region 1 and one in Region 2.

1. Still in Compute Engine, click Instance groups in the left menu.

2. Click Create instance group.

3. Set the following values, leave all other values at their defaults:

| Property                        | Value                                   |
|---------------------------------|-----------------------------------------|
| Name                            | Region 1-mig (if required, remove extra space from the name) |
| Location                        | Multiple zones                          |
| Region                          | Region 1                                |
| Instance template               | Region 1-template                       |
| Minimum number of instances     | 1                                       |
| Maximum number of instances     | 2                                       |
| Autoscaling signals             | Click dropdown                          |
| Signal type                     | CPU utilization                        |
| Target CPU utilization          | 80, click Done.                        |
| Initialization period           | 45                                      |
| Notes                           | Managed instance groups offer autoscaling capabilities that allow you to aut  |












