# Implementing Quality Gates in AWS CodeBuild Project

## Introduction
Welcome to this lecture where we'll implement a quality gate within our AWS CodeBuild project. A quality gate ensures that if SonarCloud identifies security or code quality issues within our source code, the CodeBuild project fails, allowing us to address and fix the issues before they impact production. In this demonstration, we'll be using SonarCloud, but similar principles apply to SonarQube.

## Prerequisites
Make sure you've completed the previous steps, including setting up AWS CodeBuild, integrating AWS Secrets Manager, and configuring SonarCloud.

## Implementing a Quality Gate in CodeBuild
To implement a quality gate in our CodeBuild pipeline, we need to make changes to our buildspec.yml file. So you buildspec.yml should look something like this:
```yaml
version: 0.1
env:
    secrets-manager:
      TOKEN: yoursecretname:yourkeyofthesecretvalue
phases:
  build:
    commands:
      - mvn verify sonar:sonar -Dsonar.projectKey=sonarcloudprojectkey -Dsonar.organization=sonarcloudorg -Dsonar.host.url=https://sonarcloud.io -Dsonar.login=$TOKEN 
      - sleep 5
      - |- 
        quality_status=$(curl -s -u $TOKEN: https://sonarcloud.io/api/qualitygates/project_status?projectKey=sonarcloudprojectkey | jq -r '.projectStatus.status')
        echo "SonarCloud analysistatus is $quality_status"; 
        if [ $quality_status = "ERROR" ] ; then exit 1;fi
```

## Explanation of Changes:

• Added a sleep 5 command to allow time for SonarCloud to update after running the analysis.
• Introduced a multi-line command using |- for better readability.
• Used curl to query the SonarCloud API for the quality gate status.
• Checked if the quality gate status is "ERROR" and failed the build if true.
