# Integrating AWS Secrets Manager with CodeBuild
## Introduction
Welcome to this step where we'll enhance the security of our CodeBuild project by storing sensitive information in AWS Secrets Manager. We previously stored a SonarCloud token directly in our repository with the buildspec.yml file, but in real-world scenarios, it's a best practice to store such secrets in a secure service like Secrets Manager. Let's dive into the process!

## Prerequisites
Ensure you have completed the previous lectures, including creating a CodeBuild project and a SonarCloud token.

## Storing SonarCloud Token in Secrets Manager
1. Copy the SonarCloud token from your buildspec.yml file.

2. Open the AWS Secrets Manager service.

3. Click on `Store a new secret`

4. For `Secret type` choose `Other type of secret`

5. Provide a key-value pair:

   Key: `tokenForSonar`

   Value: Paste in your SonarCloud token.

6. Click on "Next"

7. Enter a secret name (e.g., sonar-token-secret) and click on "Next"

8. (Optional) Enable rotation if needed and click on "Next"

9. Review the details and click on "Store"

## Updating buildspec.yml to Use Secrets Manager
1. Open your buildspec.yml file in the CodeCommit repository.

2. Add the following section to the buildspec.yml file to retrieve the SonarCloud token from Secrets Manager:

```yaml
env:
   secrets-manager:
     TOKEN: yoursecretname:yourkeyofthesecretvalue               
```

3. Then in our buildspec.yml, we will replace our actual SonarCloud Token with this variable pointing to our secret in Secrets Manager. So our buildspec.yml file should look something like this:

```yaml
version: 0.1
env:
    secrets-manager:
      TOKEN: SonarCloud-Secret:TokenForSonar
phases:
  build:
    commands:
      - mvn verify sonar:sonar -Dsonar.projectKey=yoursonarcloudprojectkey -Dsonar.organization=yoursonarcloudorg -Dsonar.host.url=https://sonarcloud.io -Dsonar.login=$TOKEN
```









