# Improve your security posture using IAM authorization on the API Gateway

First, lets configure IAM-based authorization (SigV4) on the API Gateway to enhance security.

## Steps:

1. Open the AWS Management Console and navigate to API Gateway.
2. Select the API you want to secure.
3. Select Under one of the API Resources eg.`/orders`, then choose the method eg.`GET` .
4. In the eg. `/orders-GET-Method Execution` section, choose the `Method Request` card.
5. Next to Authorization, choose `Edit`, then select AWS IAM in the drop-down menu.
6. Save your selection by choosing `Update`.
7. Deploy the API by selecting `Deploy API` from the Actions drop-down menu.

To update the Service which is calling your API eg. `EC2`, modify the code to pass request with [SigV4](https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_aws-signing.html) as shown below in python:

### Sample Python code without SigV4:

```python
def call_api(api_id: str, api_key=None): 
    host = api_id + '.execute-api.' + region + '.amazonaws.com'
    base_url = f'https://{host}/api'
    get_url = f'{base_url}/{os.environ["api_resource"]}'
    response = requests.get(get_url, headers={'x-api-key': api_key}, timeout=2)
    return response
```

Sample Python code with SigV4:
```
# Simplifies making Amazon SigV4 calls with the python requests library
from aws_requests_auth.boto_utils import BotoAWSRequestsAuth
def call_api(api_id: str, api_key=None): 
    host = api_id + '.execute-api.' + region + '.amazonaws.com'
    base_url = f'https://{host}/api'
    get_url = f'{base_url}/{os.environ["api_resource"]}'
    
    # Get authentication token - SigV4
    auth = BotoAWSRequestsAuth(aws_host=host, aws_region=region, aws_service='execute-api')
    response = requests.get(get_url, headers={'x-api-key': api_key}, timeout=2, auth=auth)
    return response
```


