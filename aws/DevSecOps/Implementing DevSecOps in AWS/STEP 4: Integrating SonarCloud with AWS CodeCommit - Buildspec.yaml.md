# Integrating SonarCloud with AWS CodeCommit - Buildspec.yaml
### Introduction
Welcome to STEP 4 where we'll be integrating SonarCloud into our AWS CodeCommit project. To achieve this, we need to create a buildspec.yaml file, a standard format provided by AWS for building projects and integrating various tools.

### Creating the buildspec.yaml file
Let's dive into the process of creating the buildspec.yaml file.

```yaml
version: 0.1
phases:
  build:
    commands:
      - mvn verify sonar:sonar -Dsonar.projectKey=projectKey -Dsonar.organization=projectOrg -Dsonar.host.url=https://sonarcloud.io -Dsonar.login=token 
```

#### Explanation:
Version: Specifies the version of the buildspec.yaml file. In this case, it's set to 0.1.

Phases: Describes different phases of the build process. We currently have the build phase.

Commands: Contains the commands to be executed during the build phase. We're using Maven to run tests and Sonar analysis.

mvn verify: Executes Maven to run tests.

mvn sonar:sonar: Executes the Sonar analysis.

-Dsonar.projectKey: Placeholder for your SonarCloud project key.

-Dsonar.organization: Placeholder for your SonarCloud organization.

-Dsonar.host.url: SonarCloud URL.

-Dsonar.login: Your SonarCloud authentication token.
