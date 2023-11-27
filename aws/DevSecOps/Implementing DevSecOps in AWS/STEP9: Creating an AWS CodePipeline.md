# Creating an AWS CodePipeline

## Introduction
Welcome to this lecture, where we will create an AWS CodePipeline. AWS CodePipeline is a continuous integration and deployment service that automates the building, testing, and deployment phases of your release process. It's a crucial component for managing code changes efficiently.

## Prerequisites
Ensure you have completed the previous steps, including setting up AWS CodeBuild and integrating SonarCloud.

# Creating the AWS CodePipeline
1. Let's walk through the process of creating an AWS CodePipeline.

2. Open the AWS Management Console and navigate to CodePipeline.

3. Click on `Create pipeline`

## Pipeline settings:

1. Enter a pipeline name, e.g., `MyFirstCodePipeline`

2. AWS will create a service role for you; no need to create one manually.

3. Make sure there are no spaces in the pipeline name.

## Advanced settings:

1. Choose whether to store your artifact in the default location or a custom location. For this demo, use the default.

2. Use the default AWS managed encryption key. If you have a different key, select `Customer managed key`

3. Click on "Next."

## Add source stage:

1. Choose the source provider as `AWS CodeCommit`.

2. Select your repository.

3. Choose the branch (e.g., master).

4. AWS CloudWatch Events will trigger the pipeline automatically whenever there is a change.

5. Use the default CodePipeline format for the output artifact.

6. Click on "Next."

## Add build stage:

1. Choose the build provider as AWS CodeBuild.

2. Select the CodeBuild project you created.

3. Click on "Next."

## Add deploy stage (optional):

1. Skip this stage since we won't be deploying in this step.

2. Click on "Next."

3. Review the pipeline information and click on "Create Pipeline."

4. The pipeline will start executing immediately. You can monitor the progress on the CodePipeline dashboard.


## Great Job🕺
Great Job! You've successfully created an AWS CodePipeline. This pipeline will automatically trigger whenever there's a change in your AWS CodeCommit repository. In the next step, we'll integrate Snyk within this pipeline to enhance our security checks.


