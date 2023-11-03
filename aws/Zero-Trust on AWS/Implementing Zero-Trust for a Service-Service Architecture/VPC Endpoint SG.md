## Improve the security posture by tuning the VPC endpoint security group
NOTE: Security groups can reference other security groups, allowing traffic only from hosts or services associated with that security group we have referenced.

In this task, we'll update the security group of your VPC endpoint.

**Steps:**

1. In the list of Endpoints, select your chosen endpoint to secure.
2. Choose the `Security Groups` tab.
3. Under the `Group ID`, choose the security group link.
4. Edit the inbound rules and replace the existing rule with the new rule:
   - Type: HTTPS
   - Source: Custom. And select the security group of the calling service eg. EC2 Instance. 
   - Description: From ServiceA Instances Security Group
5. Save the rules.

With this we are adding an extra layer of defense, only allowing access to the VPC Endpoint from services associated with the referenced security group.
