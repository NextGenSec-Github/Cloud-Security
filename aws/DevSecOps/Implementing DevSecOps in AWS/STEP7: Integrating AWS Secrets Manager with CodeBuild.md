# Integrating AWS Secrets Manager with CodeBuild
## Introduction
Welcome to this step where we'll enhance the security of our CodeBuild project by storing sensitive information in AWS Secrets Manager. We previously stored a SonarCloud token directly in our repository with the buildspec.yml file, but in real-world scenarios, it's a best practice to store such secrets in a secure service like Secrets Manager. Let's dive into the process!

## Prerequisites
Ensure you have completed the previous lectures, including creating a CodeBuild project and a SonarCloud token.

## Storing SonarCloud Token in Secrets Manager
1. Copy the SonarCloud token from your buildspec.yml file.

2. Open the AWS Secrets Manager service.

3. Click on "Store a new secret."

4. Provide a key-value pair:

    - Key: Token for Sonar

    - Value: Paste in your SonarCloud token.

5. Click on "Next."

6. Enter a secret name (e.g., sonar-token-secret) and click on "Next."

7. (Optional) Enable rotation if needed and click on "Next."

8. Review the details and click on "Store."
