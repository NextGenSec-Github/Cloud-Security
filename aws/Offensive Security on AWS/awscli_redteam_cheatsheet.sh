# ========================================
# RECONNAISSANCE & INFORMATION GATHERING COMMANDS
# ========================================

# List all ec2 instances
aws ec2 describe-instances

# List all s3 buckets
aws s3 ls

# View the access policy of a bucket
aws s3api get-bucket-policy --bucket <bucket-name>

# List all iam users
aws iam list-users

# Get information about the user/role
aws sts get-caller-identity

# Retrieves the policy attached to a role
aws iam get-role-policy --role-name <role-name> --policy-name <policy-name>

# Retrieves the policy attached to a group
aws iam get-group-policy --group-name <group-name> --policy-name <policy-name>

# Retrieves the policy attached to a user
aws iam get-user-policy --user-name <iam-username>

# Lists policies attached to a role
aws iam list-attached-role-policies --role-name <role-name>

# List all rds instances
aws rds describe-db-instance

# List all lambda functions
aws lambda list-functions

# List Delegated Service Administrators for Accounts Within Your AWS Organization
organizations list-delegated-services-for-account --account-id <account-id> --profile <e.g. Production>

# ====================
# PRIVILEGE ESCALATION
# ====================

# Instance Metdata Service V2 has added protections with sessions authentication with tokens
TOKEN=`curl -X PUT "http://169.254.169.254/latest/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 21600"`
curl -H "X-aws-ec2-metadata-token: $TOKEN" -v http://169.254.169.254/latest/meta-data/








