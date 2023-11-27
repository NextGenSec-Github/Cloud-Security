## Integrating OWASP ZAP for DAST in AWS DevSecOps Pipeline
## Introduction
Welcome to this step where we'll integrate OWASP ZAP (Zed Attack Proxy) for Dynamic Application Security Testing (DAST) within our AWS DevSecOps pipeline. By incorporating DAST into our pipeline, we can automatically scan web applications for security vulnerabilities during the build process.

## Prerequisites
Ensure you have the following:
1. AWS CodeBuild project set up (as discussed in previous steps).

2. AWS CodePipeline configured (as discussed in previous steps).

3. A sample web application URL to scan.

## Integration Steps
Let's go through the steps to integrate OWASP ZAP in our AWS DevSecOps pipeline.

### 1. Update buildspec.yml
Open the buildspec.yml file in your AWS CodeCommit repository and replace the code, so your buildspec.yml file should look something like this:
```yaml
version: 0.1
phases:
  build:
    commands:
    - |-
        apt-get update
        apt-get -y install wget
        apt-get -y install default-jdk
        wget https://github.com/zaproxy/zaproxy/releases/download/v2.11.1/ZAP_2.11.1_Linux.tar.gz
        tar -xvf ZAP_2.11.1_Linux.tar.gz
        cd ZAP_2.11.1
        ./zap.sh -cmd -quickurl https://www.example.com -quickprogress -quickout ../zap_report.html 
artifacts:
  files:
    - zap_report.html
```

### In this code:

1. We update the system and install necessary utilities (apt-get update, apt-get install -y wget default-jdk).
2. We download and unzip OWASP ZAP (wget, mkdir, tar).
3. We navigate to the ZAP directory and execute the ZAP scan with specific parameters (sh zap.sh -quickurl https://www.example.com -quickprogress -quickout zap_report.html).
4. The resulting zap_report.html is stored in the artifacts.
