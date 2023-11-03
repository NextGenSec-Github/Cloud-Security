...
# Simplifies making Amazon SigV4 calls with the python requests library
from aws_requests_auth.boto_utils import BotoAWSRequestsAuth

def call_api(api_id: str, api_key=None): 
    host = api_id+'.execute-api.'+region+'.amazonaws.com'
    base_url = f'https://{host}/api'
    get_url = f'{base_url}/{os.environ["api_resource"]}'

    # Get authentication token - SigV4
    auth = BotoAWSRequestsAuth(aws_host=host, aws_region=region, aws_service='execute-api')
    response = requests.get(get_url, headers={'x-api-key': api_key}, timeout=2, auth=auth)
    return response
...
