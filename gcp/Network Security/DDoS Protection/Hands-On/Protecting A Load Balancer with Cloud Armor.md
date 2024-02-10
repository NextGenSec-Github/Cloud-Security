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

Managed instance groups offer autoscaling capabilities that allow you to automatically add or remove instances from a managed instance group based on increases or decreases in load. Autoscaling helps your applications gracefully handle increases in traffic and reduces cost when the need for resources is lower. You just define the autoscaling policy and the autoscaler performs automatic scaling based on the measured load.

### Now repeat the same procedure to create a second instance group for Region 2-mig in Region 2:

1. Click Create Instance group.

2. Set the following values, leave all other values at their defaults:

| Property                        | Value                          |
|---------------------------------|--------------------------------|
| Name                            | Region 2-mig                   |
| Location                        | Multiple zones                 |
| Region                          | Region 2                       |
| Instance template               | Region 2-template              |
| Minimum number of instances     | 1                              |
| Maximum number of instances     | 2                              |
| Autoscaling signals             | Click dropdown                 |
| Signal type                     | CPU utilization                |
| Target CPU utilization          | 80, click Done.                |
| Initialization period           | 45                             |

3. Click `Create`

### Verify the backends
Verify that VM instances are being created in both regions and access their HTTP sites.

1. Still in Compute Engine, click VM instances in the left menu.

2. Notice the instances that start with Region 1-mig and Region 2-mig. These instances are part of the managed instance groups.

3. Click on the External IP of an instance of Region 1-mig. You should see the Client IP (your IP address), the Hostname (starts with Region 1-mig) and the Server Location (a zone in Region 1).

4. Click on the External IP of an instance of Region 2-mig. You should see the Client IP (your IP address), the Hostname (starts with Region 2-mig) and the Server Location (a zone in Region 2).

## 3. Configure the HTTP Load Balancer

### Start the configuration
1.In the Cloud console, click Navigation menu (Navigation menu icon) > click Network Services > Load balancing, and then click Create load balancer.

2. Under Application Load Balancer (HTTP/S), click on Start configuration.

3. Select From Internet to my VMs or serverless services, and click Continue.

4. Set the New HTTP(S) Load Balancer Name to http-lb.

### Configure the frontend
The host and path rules determine how your traffic will be directed. For example, you could direct video traffic to one backend and static traffic to another backend. However, you are not configuring the Host and path rules in this lab.

1. Click on Frontend configuration.

2. Specify the following, leaving all other values at their defaults:

| Property   | Value      |
|------------|------------|
| Protocol   | HTTP       |
| IP version | IPv4       |
| IP address | Ephemeral  |
| Port       | 80         |

3. Click Done.

4. Click Add Frontend IP and port.

5. Specify the following, leaving all other values at their defaults:

| Property   | Value         |
|------------|---------------|
| Protocol   | HTTP          |
| IP version | IPv6          |
| IP address | Auto-allocate |
| Port       | 80            |

6. Click `Done`

HTTP(S) load balancing supports both IPv4 and IPv6 addresses for client traffic. Client IPv6 requests are terminated at the global load balancing layer, then proxied over IPv4 to your backends.

### Configure the backend
Backend services direct incoming traffic to one or more attached backends. Each backend is composed of an instance group and additional serving capacity metadata.

1. Click on Backend configuration.

2. For Backend services & backend buckets, click Create a backend service.

3. Set the following values, leave all other values at their defaults:

| Property        | Value            |
|-----------------|------------------|
| Name            | http-backend     |
| Instance group  | Region 1-mig     |
| Port numbers    | 80               |
| Balancing mode  | Rate             |
| Maximum RPS     | 50               |
| Capacity        | 100              |

This configuration means that the load balancer attempts to keep each instance of Region 1-mig at or below 50 requests per second (RPS).

4. Click Done.

5. Click Add a backend.

6. Set the following values, leave all other values at their defaults:

| Property                           | Value            |
|------------------------------------|------------------|
| Instance group                     | Region 2-mig     |
| Port numbers                       | 80               |
| Balancing mode                     | Utilization      |
| Maximum backend utilization        | 80               |
| Capacity                           | 100              |

This configuration means that the load balancer attempts to keep each instance of Region 2-mig at or below 80% CPU utilization.

7. Click Done.

8. For Health Check, select Create a health check.

9. Set the following values, leave all other values at their defaults:

| Property   | Value       |
|------------|-------------|
| Name       | http-health-check |
| Protocol   | TCP         |
| Port       | 80          |


