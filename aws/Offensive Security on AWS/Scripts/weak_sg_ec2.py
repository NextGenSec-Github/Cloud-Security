import boto3

def deploy_instance():
  ec2_client = boto3.client('ec2')
  response = ec2_client.run_instances(
    ImageId='ami-123456789',
    InstanceType='t2.micro',
    KeyName='my-keypair',
    SecurityGroupIds=[weak-security-group-id],
    UserData='your-user-data',
    MinCount=1
    MaxCount=1
  )
  return response['Instances'][0]['InstanceId']


def main():
  instance_id = deploy_instance()
  print(f'Instance deployed with ID: {instance_id}')

if __name__ = "__main__":
  main()











