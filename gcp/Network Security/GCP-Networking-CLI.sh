# =======================================
# GCP CLI NETWORKING COMMANDS CHEATSHEET
# =======================================

# GENERAL COMMANDS

# Command to list all networks in the current project
gcloud compute networks list

# Command to describe a specific network
gcloud compute networks describe NETWORK_NAME

# Command to create a new VPC network
gcloud compute networks create NETWORK_NAME --subnet-mode=MODE

# Command to delete a VPC network
gcloud compute networks delete NETWORK_NAME

# Command to list all firewall rules in the current project
gcloud compute firewall-rules list

# Command to describe a specific firewall rule
gcloud compute firewall-rules describe RULE_NAME

# Command to create a new firewall rule
gcloud compute firewall-rules create RULE_NAME --action=ACTION --direction=DIRECTION --rules=RULES

# Command to delete a firewall rule
gcloud compute firewall-rules delete RULE_NAME

# Command to list all subnets in the current project
gcloud compute networks subnets list

# Command to describe a specific subnet
gcloud compute networks subnets describe SUBNET_NAME

# Command to create a new subnet
gcloud compute networks subnets create SUBNET_NAME --network=NETWORK_NAME --range=SUBNET_RANGE --region=REGION

# Command to delete a subnet
gcloud compute networks subnets delete SUBNET_NAME

# ===============
# NETWORK TROUBLESHOOTING
# ===============

# Command to check the status of a network interface
ifconfig

# Command to display routing table information
route -n

# Command to test network connectivity to a specific host
ping HOSTNAME_OR_IP

# Command to check connectivity to a specific port on a remote host
nc -zv HOSTNAME_OR_IP PORT

# Command to perform a traceroute to a destination
traceroute HOSTNAME_OR_IP

# Command to display DNS resolver configuration
cat /etc/resolv.conf

# Command to query DNS records for a domain
nslookup DOMAIN

# Command to display network statistics
netstat -s

# Command to display active network connections
netstat -tuln

# Command to check firewall status
iptables -L

# Command to check for network interface errors
dmesg | grep -i ethernet

# Command to check for network interface errors
ip -s link

# Command to display network interface information
ip addr show

# Command to display network interface statistics
ip -s link

# Command to display network connection information
ss -tuln

# Command to display network usage
iftop

# Command to display active internet connections and sockets
lsof -i

# Command to check for DNS resolution issues
dig DOMAIN

# Command to display ARP cache
arp -a












