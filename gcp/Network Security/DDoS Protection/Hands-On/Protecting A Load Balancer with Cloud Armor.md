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

Health checks determine which instances receive new connections. This HTTP health check polls instances every 5 seconds, waits up to 5 seconds for a response and treats 2 successful or 2 failed attempts as healthy or unhealthy, respectively.

10. Click Save.

11. Check the Enable Logging box.

12. Set the Sample Rate to 1.

13. Click Create to create the backend service.

14. Click Ok.

### Review and create the HTTP Load Balancer
1. Click on Review and finalize.

2. Review the Backend and Frontend services.

3. Click on Create.

4. Wait for the load balancer to be created.

5. Click on the name of the load balancer (http-lb).

6. Note the IPv4 and IPv6 addresses of the load balancer for the next task. They will be referred to as [LB_IP_v4] and [LB_IP_v6], respectively.

## 4. Test the HTTP Load Balancer

### Access the HTTP Load Balancer
- To test IPv4 access to the HTTP Load Balancer, open a new tab in your browser and navigate to http://[LB_IP_v4]. Make sure to replace [LB_IP_v4] with the IPv4 address of the load balancer.

- If you have a local IPv6 address, try the IPv6 address of the HTTP Load Balancer by navigating to http://[LB_IP_v6]. Make sure to replace [LB_IP_v6] with the IPv6 address of the load balancer.

### Stress test the HTTP Load Balancer
Create a new VM to simulate a load on the HTTP Load Balancer using siege. Then, determine if traffic is balanced across both backends when the load is high.

1. In the console, navigate to Navigation menu (Navigation menu icon) > Compute Engine > VM instances.

2. Click Create instance.

3. Set the following values, leave all other values at their defaults:

| Property   | Value    |
|------------|----------|
| Name       | ngs-vm |
| Region     | Region 3 |
| Zone       | Zone 3   |
| Series     | E2       |

Given that Region 3 is closer to Region 1 than to Region 2, traffic should be forwarded only to Region 1-mig (unless the load is too high).

4. Click Create.

5. Wait for the ngs-1 instance to be created.

6. For ngs-1, click SSH to launch a terminal and connect.

7. Run the following command, to install siege:

8. Run the following command, to install siege:

```bash
sudo apt-get -y install siege
```

9. To store the IPv4 address of the HTTP Load Balancer in an environment variable, run the following command, replacing [LB_IP_v4] with the IPv4 address:

```bash
export LB_IP=[LB_IP_v4]
```

`0. To simulate a load, run the following command:

```bash
siege -c 150 -t120s http://$LB_IP
```

11. In the Cloud console, on the Navigation menu (Navigation menu icon), click Network Services > Load balancing.

12.Click Backends.

13. Click http-backend.

14. Navigate to http-lb.

15. Click on the Monitoring tab.

16. Monitor the Frontend Location (Total inbound traffic) between North America and the two backends for 2 to 3 minutes.
 

At first, traffic should just be directed to Region 1-mig but as the RPS increases, traffic is also directed to Region 2.

This demonstrates that by default traffic is forwarded to the closest backend but if the load is very high, traffic can be distributed across the backends.

17. Return to the SSH terminal of siege-vm.

18. Press CTRL+C to stop siege if it's still running.

## 5. Denylist the siege-vm
Use Cloud Armor to denylist the ngs-vm from accessing the HTTP Load Balancer.

### Create the security policy
Create a Cloud Armor security policy with a denylist rule for the siege-vm.

1. In the console, navigate to Navigation menu (Navigatio menu icon) > Compute Engine > VM instances.

2. Note the External IP of the ngs-vm. This will be referred to as [NGS_IP].

3. In the Cloud console, navigate to Navigation menu > Network Security > Cloud Armor Policies.

4. Click Create policy.

5. Set the following values, leave all other values at their defaults:

| Property            | Value         |
|---------------------|---------------|
| Name                | denylist-ngs  |
| Default rule action | Allow         |

6. Click Next step.

7. Click Add a rule.

8. Set the following values, leave all other values at their defaults:

9. Click Done.

10. Click Next step.

11. Click Add Target.

12. For Type, select Load balancer backend service.

13. For Target, select http-backend.

14. Click Create policy.

15. Wait for the policy to be created before moving to the next step.

### Verify the security policy

Verify that the ngs-vm cannot access the HTTP Load Balancer.

1. Return to the SSH terminal of ngs-vm.

2. To access the load balancer, run the following:

```bash
curl http://$LB_IP
```

3. Open a new tab in your browser and navigate to http://[LB_IP_v4]. Make sure to replace [LB_IP_v4] with the IPv4 address of the load balancer.

4. Back in the SSH terminal of siege-vm, to simulate a load, run the following command:

```bash
siege -c 150 -t120s http://$LB_IP
```

The command will not generate any output.

Explore the security policy logs to determine if this traffic is also blocked.

5. In the console, navigate to Navigation menu > Network Security > Cloud Armor Policies.

6. Click denylist-ngs.

7. Click Logs.

8. Click View policy logs.

9. On the Logging page, make sure to clear all the text in the Query preview. Select resource to Application Load Balancer > http-lb-forwarding-rule > http-lb then click Apply.

10. Now click Run Query.

11. Expand a log entry in Query results.

12. Expand httpRequest.

The request should be from the siege-vm IP address. If not, expand another log entry.

13. Expand jsonPayload.

14. Expand enforcedSecurityPolicy.

15. Notice that the configuredAction is to DENY with the name denylist-siege.

Cloud Armor security policies create logs that can be explored to determine when traffic is denied and when it is allowed, along with the source of the traffic.

# Congratulations!
You configured an HTTP Load Balancer with backends in Region 1 and Region 2. Then, you stress tested the Load Balancer with a VM and denylisted the IP address of that VM with Cloud Armor. You were able to explore the security policy logs to identify why the traffic was blocked.







