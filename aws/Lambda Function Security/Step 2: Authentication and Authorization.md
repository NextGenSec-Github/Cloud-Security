# Step 2: Authentication and Authorization

Authentication and authorization are foundational elements of securing AWS Lambda functions. Properly configuring authentication ensures that only authenticated entities can access your functions, while authorization controls determine what actions those entities can perform.

## Using AWS IAM for Authentication and Authorization

AWS Identity and Access Management (IAM) provides robust capabilities for managing authentication and authorization in AWS environments. Let's walk through practical examples of using IAM for Lambda function security.

### 1. Create IAM Roles

IAM roles define a set of permissions that govern what actions Lambda functions can perform and what AWS resources they can access. Here's an example of creating an IAM role for a Lambda function using AWS CLI:

```bash
aws iam create-role --role-name LambdaExecutionRole \
    --assume-role-policy-document file://trust-policy.json
```

In the trust-policy.json file, define the trust relationship policy allowing Lambda to assume the role:
```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}

```



