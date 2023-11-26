# Setting Up SonarCloud Integration with AWS CodeCommit - Part 2

### Introduction
Welcome to this step where we'll complete the setup for integrating SonarCloud with our AWS CodeCommit project. In the previous step(STEP4), we created a buildspec.yml file in our CodeCommit repository and left the placeholders empty. Now, we'll create a SonarCloud account, organization, project, and generate a security token to enable seamless integration.

### Prerequisites
Ensure you have completed the STEP4, creating the buildspec.yml file in your CodeCommit repository.

## Creating a SonarCloud Account
1. Navigate to [SonarCloud](https://www.sonarsource.com/products/sonarcloud/) and sign up using your preferred method (GitHub, Bitbucket, Azure DevOps, or GitLab).

2. If using GitHub, log in to your GitHub account when prompted to connect it with SonarCloud.

## Creating a New Organization and Project
1. Once logged in, click on the "+" icon and select "Create new organization."

2. Manually create a new organization with a unique name (e.g., "MyAWS-SecurityOrg") and choose the free plan. Click on "Create organization."

3. After creating the organization, click on the "+" icon again and select "Create a new project."

4. Provide a project key (e.g., "MyAWS-SecurityProject") and set the visibility to public. Click on "Set up."

## Generating a Security Token
1. Go to your account settings by clicking on your account name in the top right corner, then select "Account."

2. Click on the "Security" tab and generate a new token. Provide a unique name (e.g., "AWS-Token") and click on "Generate."

3. Copy the generated token and store it in a secure place, as it won't be visible again.

