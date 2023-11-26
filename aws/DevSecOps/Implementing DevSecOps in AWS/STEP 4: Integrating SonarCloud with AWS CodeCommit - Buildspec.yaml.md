# Integrating SonarCloud with AWS CodeCommit - Buildspec.yaml
### Introduction
Welcome to STEP 4 where we'll be integrating SonarCloud into our AWS CodeCommit project. To achieve this, we need to create a buildspec.yaml file, a standard format provided by AWS for building projects and integrating various tools.

### Creating buildspec.yaml
Let's dive into the process of creating the buildspec.yaml file.

```yaml
version: 0.1
phases:
  build:
    commands:
      - mvn verify sonar:sonar -Dsonar.projectKey=projectKey -Dsonar.organization=projectOrg -Dsonar.host.url=https://sonarcloud.io -Dsonar.login=token 
```
