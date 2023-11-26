# Setting Up CodeBuild for SonarCloud Integration - Part 1

## Introduction
Welcome to this step where we'll set up an AWS CodeBuild project to build our code from the CodeCommit repository and analyze it using SonarCloud. This is a crucial step in ensuring code quality and security. Let's dive into it!

## Prerequisites
Make sure you have completed the previous steps, including creating a buildspec.yml file with the correct values in your CodeCommit repository.

## Creating a CodeBuild Project
1. Go to the AWS CodeBuild Console.

2. Click on "Create build project."

### Project Configuration:
Project name: Enter a unique name, e.g., AWSProjectBuild-1.

Tags: You can add tags for better identification (optional).

### Source:
Source provider: Select `AWS CodeCommit`

Repository: Choose your CodeCommit repository (e.g., MyAWSSecurity-Repo).

Branch: Select the branch containing your source code (e.g., master).

### Environment:
Environment image: Choose `Managed image`

Operating system: Select `Ubuntu`

Runtime: Choose `Standard`

Image: Select the latest available image.

### Service role:

Let AWS create a service role for CodeBuild by selecting `Create a service role in your account`

### Buildspec:
Leave the "Buildspec name" empty since you're using the standard buildspec.yml name.

### Click on "Create build project."

AWS will create the CodeBuild project, and you'll be redirected to the project details page.

## Starting the Build
1. Click on "Start build."

2. Review the build details and click on "Start build."

3. Monitor the build logs to ensure the build is progressing without errors.

4. Once the build is complete, you'll find a link to the SonarCloud analysis results. Click on the provided URL to view the analysis on SonarCloud.

## Checking SonarCloud Analysis
1. Navigate to your SonarCloud Dashboard.

2. Go to "My Projects" to see the analysis results.

3. Analyze the results, including code smells, lines of code, and test coverage.













