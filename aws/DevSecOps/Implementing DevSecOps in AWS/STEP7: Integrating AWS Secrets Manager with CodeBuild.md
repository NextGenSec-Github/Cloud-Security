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

   Key: `tokenForSonar` or your any key name of your choice

   Value: Paste in your SonarCloud token.

6. Click on "Next"

7. Enter a secret name (e.g., sonar-token-secret) and click on "Next"

8. (Optional) Enable rotation if needed and click on "Next"

9. Review the details and click on "Store"

## Updating buildspec.yml to Use Secrets Manager
1. Open your buildspec.yml file in the CodeCommit repository and click `Edit`.

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
      TOKEN: yoursecretname:yourkeyofthesecretvalue 
phases:
  build:
    commands:
      - mvn verify sonar:sonar -Dsonar.projectKey=yoursonarcloudprojectkey -Dsonar.organization=yoursonarcloudorg -Dsonar.host.url=https://sonarcloud.io -Dsonar.login=$TOKEN
```

4. Finally lets enter `Author Name` and `Email`, and commit the changes!


## Granting CodeBuild Permission to Access Secrets Manager
1. Open the IAM (Identity and Access Management).

2. Click on `Roles`

3. Locate and click on the role associated with your CodeBuild Build Project(e.g., CodeBuild-AWSProjectBuild-1-service-role). Alternatively, you can just go and click on your build project and under `Build Details` scroll down to `Environment` section and click on the service role link.

4. Under `Permissions` click on `Add Permissions` and from the drop down select `Attach Policies`.

5. Search for `SecretsManagerReadWrite` policy.

6. Attach the `SecretsManagerReadWrite` policy to the role by clicking `Attach Policy`.

## Testing the Build
1. Go back to the CodeBuild console and click on your CodeBuild Project

2. Trigger a new build in CodeBuild by clicking `Start Build`.

3. Monitor the build logs to ensure it retrieves the SonarCloud token from Secrets Manager.

4. Confirm that the build is successful and SonarCloud analysis is completed.

Congratulations🎉
Congratulations! You've successfully integrated AWS Secrets Manager with your CodeBuild project, enhancing the security of your sensitive information. In the next step, we'll explore creating a build pipeline for a more streamlined development process.


