# Integrating AWS Secrets Manager with CodeBuild
## Introduction
Welcome to this step where we'll enhance the security of our CodeBuild project by storing sensitive information in AWS Secrets Manager. We previously stored a SonarCloud token directly in our repository with the buildspec.yml file, but in real-world scenarios, it's a best practice to store such secrets in a secure service like Secrets Manager. Let's dive into the process!

# Prerequisites
Ensure you have completed the previous lectures, including creating a CodeBuild project and a SonarCloud token.
