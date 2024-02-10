#!/bin/bash

# GCP CLI Networking Commands Cheatsheet

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
