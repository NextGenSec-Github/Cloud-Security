import boto3

# Create the EC2 Client
ec2_client = boto3.client('ec2')

# Define the AMI ID
ami_id = 'ami-12345...'

# Define the AWS Account to share the AMI with
account_id = '123456789'

# Share the AMI with the external AWS Account
ec2_client.modify_image_attribute(
  Image_Id=ami_id,
  LaunchPermission={
  'Add': [{'UserId': account_id}]
  }


)



