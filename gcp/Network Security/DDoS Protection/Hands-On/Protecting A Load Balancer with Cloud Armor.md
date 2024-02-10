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
Set the following values, leave all other values at their defaults:

| Property            | Value                                      |
|---------------------|--------------------------------------------|
| Name                | default-allow-http                         |
| Network             | default                                    |
| Targets             | Specified target tags                      |
| Target tags         | http-server                                |
| Source filter       | IPv4 Ranges                                |
| Source IPv4 ranges | 0.0.0.0/0                                  |
| Protocols and ports | Specified protocols and ports, TCP, type: 80|
