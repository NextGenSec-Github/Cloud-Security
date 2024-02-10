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






















