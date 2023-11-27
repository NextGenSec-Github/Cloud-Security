# Storing CodeBuild Artifacts in S3 Bucket
## Introduction
Welcome to this step where we'll learn how to store CodeBuild artifacts in an Amazon S3 bucket. Storing artifacts in S3 provides a scalable and durable storage solution for the build outputs.

## Prerequisites
Ensure you have an existing CodeBuild project. If you haven't set up a CodeBuild project yet, please refer to the previous steps.

## Storing Artifacts in S3
Follow these steps to configure your CodeBuild project to store artifacts in an S3 bucket:

1. Open the AWS Management Console and navigate to CodeBuild.

2. Click on "Build projects."

3. Select the CodeBuild project you want to configure (e.g., AWSProjectBuild-1).

4. Click on "Edit."

5. In the left menu, click on "Artifacts."

6. On the "Edit artifacts" page, select the "Type" as "Amazon S3."

7. Click on the S3 bucket name field to choose an existing S3 bucket.

8. A list of available S3 buckets will be displayed. Choose the desired S3 bucket for storing artifacts.

#### Note: Ensure the chosen S3 bucket has the necessary permissions for CodeBuild to upload artifacts.

9. Scroll down to the bottom and click on "Update Artifacts."

You'll see a confirmation message: "The Artifacts for the build project have been successfully updated."

The message also provides the artifacts upload location, indicating that the artifacts will be stored in the selected S3 bucket.

## Congratulations! 
You've successfully configured your CodeBuild project to store artifacts in an S3 bucket.
In the next step, we'll integrate OWASP ZAP for dynamic application security testing (DAST) and store the scan reports in the same S3 bucket.
