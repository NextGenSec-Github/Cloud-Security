# ========================================
# GENERAL & INFORMATION GATHERING COMMANDS
# ========================================

# List all ec2 instances
aws ec2 describe-instances

# List all s3 buckets
aws s3 ls

# List all iam users
aws iam list-users

# Retrieves the policy attached to a role

# List all rds instances
aws rds describe-db-instance

# List all lambda functions
aws lambda list-functions

# List Delegated Service Administrators for Accounts Within Your AWS Organization
organizations list-delegated-services-for-account --account-id <account-id> --profile <e.g. Production>

# ====================
# PRIVILEGE ESCALATION
# ====================



