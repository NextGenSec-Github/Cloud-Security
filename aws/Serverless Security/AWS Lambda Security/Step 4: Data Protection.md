# Step 4: Data Protection

Data protection is paramount when working with AWS Lambda functions to ensure the confidentiality and integrity of sensitive information processed by your serverless applications. This step focuses on encrypting data both at rest and in transit, utilizing AWS services such as AWS Key Management Service (KMS) for encryption.

## Encryption at Rest

Encrypting data at rest helps safeguard sensitive information stored in various AWS services. Let's explore how to enable encryption at rest for data stored in Amazon S3 buckets:

### 1. Server-Side Encryption with S3

You can enable server-side encryption (SSE) for S3 buckets to automatically encrypt objects upon upload. Here's how to create an encrypted S3 bucket using AWS CLI:

```bash
aws s3api create-bucket --bucket my-encrypted-bucket --region us-west-2 --create-bucket-configuration LocationConstraint=us-west-2 --server-side-encryption "AES256"
```

This command creates an S3 bucket named my-encrypted-bucket in the us-west-2 region with server-side encryption using AES256 encryption algorithm.

### 2. KMS-Managed Encryption Keys
AWS KMS allows you to create and manage encryption keys for encrypting data stored in various AWS services. Let's demonstrate how to create a KMS key and use it for server-side encryption with S3:

```bash
aws kms create-key --description "MyEncryptionKey"
```
This command creates a customer master key (CMK) in AWS KMS named MyEncryptionKey. You can then specify this key when creating an S3 bucket to enable server-side encryption with KMS.














