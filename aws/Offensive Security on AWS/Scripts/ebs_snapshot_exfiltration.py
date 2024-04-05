import boto3

# Create the EC2 client
ec2_client = boto3.client('ec2')

# Define the EBS snapshot
snapshot_id = 'snap-123456789'

# Define the AWS Account ID to share the snapshot with
account_id = '123456789'

# Share the snapshot with the External AWS Account
ec2_client.modify_snapshot_attribute(
  SnapshotId=snapshot_id,
  Attribute='createVolumePermission'
  CreateVolumePermission={
    'Add':[{'UserId': account_id}]
  }


  
)







