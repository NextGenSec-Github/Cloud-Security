## Improve the security posture using VPC endpoint policy

In this task, you'll update the VPC endpoint policy to restrict which identities are allowed to make which API calls.

**Steps:**

1. Open the AWS Management Console and navigate to VPC.
2. Select your chosen endpoint to secure.
3. Choose the `Policy` tab.
4. Edit the policy and add the following policy:

```json
{
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": {
                "AWS": "INSERT_SERVICEA_INSTANCE_ROLE_ARN"
            },
            "Action": "execute-api:Invoke",
            "Resource": "INSERT_API_METHOD_ARN"
        }
    ]
}
