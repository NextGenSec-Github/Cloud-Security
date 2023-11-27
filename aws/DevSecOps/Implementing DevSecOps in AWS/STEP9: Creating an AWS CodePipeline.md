# Creating an AWS CodePipeline

## Introduction
Welcome to this lecture, where we will create an AWS CodePipeline. AWS CodePipeline is a continuous integration and deployment service that automates the building, testing, and deployment phases of your release process. It's a crucial component for managing code changes efficiently.

## Prerequisites
Ensure you have completed the previous steps, including setting up AWS CodeBuild and integrating SonarCloud.

# Creating the AWS CodePipeline
1. Let's walk through the process of creating an AWS CodePipeline.

2. Open the AWS Management Console and navigate to CodePipeline.

3. Click on "Create pipeline."

## Pipeline settings:

Enter a pipeline name, e.g., FirstCodePipeline.
AWS will create a service role for you; no need to create one manually.
Make sure there are no spaces in the pipeline name.
Advanced settings:

Choose whether to store your artifact in the default location or a custom location. For this demo, use the default.
Use the default AWS managed encryption key. If you have a different key, select "Customer managed key."
Click on "Next."

Add source stage:

Choose the source provider as AWS CodeCommit.
Select your repository (e.g., ASecurityGuru-NewRepo).
Choose the branch (e.g., master).
AWS CloudWatch Events will trigger the pipeline automatically whenever there is a change.
Use the default CodePipeline format for the output artifact.
Click on "Next."

Add build stage:

Choose the build provider as AWS CodeBuild.
Select the CodeBuild project you created.
Click on "Next."

Add deploy stage (optional):

Skip this stage since we won't be deploying in this lecture.
Click on "Next."

Review the pipeline information and click on "Create Pipeline."

The pipeline will start executing immediately. You can monitor the progress on the CodePipeline dashboard.
