# Step 7: Identity and Access Management (IAM)

Identity and Access Management (IAM) is crucial for controlling access to AWS Lambda functions and other AWS resources. This step focuses on implementing IAM best practices to ensure secure authentication, authorization, and least privilege access.

## IAM Roles for Lambda Functions

IAM roles define the permissions that Lambda functions have when they are invoked. Let's explore practical examples of creating IAM roles for Lambda functions:

### 1. Basic Lambda Execution Role

Create a basic IAM role that allows Lambda functions to write logs to CloudWatch Logs and access necessary AWS services:

```yaml
Resources:
  MyLambdaExecutionRole:
    Type: AWS::IAM::Role
    Properties:
      AssumeRolePolicyDocument:
        Version: "2012-10-17"
        Statement:
          - Effect: Allow
            Principal:
              Service: lambda.amazonaws.com
            Action: sts:AssumeRole
      Policies:
        - PolicyName: LambdaBasicExecutionPolicy
          PolicyDocument:
            Version: "2012-10-17"
            Statement:
              - Effect: Allow
                Action:
                  - logs:CreateLogGroup
                  - logs:CreateLogStream
                  - logs:PutLogEvents
                Resource: "arn:aws:logs:*:*:*"
```

This CloudFormation template snippet creates an IAM role named MyLambdaExecutionRole with permissions to write logs to CloudWatch Logs.

### 2. Access to Other AWS Services
Extend the IAM role to grant Lambda functions access to other AWS services such as S3, DynamoDB, or SNS:

```yaml
Resources:
  MyLambdaExecutionRole:
    Type: AWS::IAM::Role
    Properties:
      AssumeRolePolicyDocument:
        Version: "2012-10-17"
        Statement:
          - Effect: Allow
            Principal:
              Service: lambda.amazonaws.com
            Action: sts:AssumeRole
      Policies:
        - PolicyName: LambdaAccessPolicy
          PolicyDocument:
            Version: "2012-10-17"
            Statement:
              - Effect: Allow
                Action:
                  - logs:CreateLogGroup
                  - logs:CreateLogStream
                  - logs:PutLogEvents
                Resource: "arn:aws:logs:*:*:*"
              - Effect: Allow
                Action:
                  - s3:GetObject
                  - s3:PutObject
                Resource: "arn:aws:s3:::my-bucket/*"
```
This snippet extends the IAM role to allow Lambda functions to read from and write to an S3 bucket named my-bucket.

## Least Privilege Access
Follow the principle of least privilege when defining IAM policies for Lambda functions. Limit permissions to only those required for the function's operation. For example, if a function only reads from an S3 bucket, grant read-only access to that specific bucket.

## IAM Policies and Permissions Boundary
Consider using IAM policies and permissions boundaries to enforce stricter access controls and prevent privilege escalation. Permissions boundaries can be applied to IAM roles to limit the permissions that can be attached to the role.

## AWS Lambda Function Authorizers
Implement AWS Lambda function authorizers to control access to API Gateway endpoints. Authorizers can validate bearer tokens, verify signatures, or execute custom authentication logic before allowing access to API resources.


