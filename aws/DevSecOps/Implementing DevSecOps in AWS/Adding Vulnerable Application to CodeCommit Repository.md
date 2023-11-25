# Adding Vulnerable Application to CodeCommit Repository

## Introduction
Welcome to the next chapter of our tutorial series. In this chapter, we will download a vulnerable application from my GitHub repository and push it to our CodeCommit repository in AWS. The vulnerable application we'll be working with is the Java Reachability Playground.

## Steps to Download and Push Vulnerable Application

1. Go the to [vulnerable code zip download file](https://github.com/NextGenSec-Github/CloudSecurity/blob/main/aws/DevSecOps/Implementing%20DevSecOps%20in%20AWS/aws-vulnerable-code-without-buildspec-main%20(2).zip)
2. Download the application by clicking on the "Download" button.
3. Once the download is complete, navigate to the folder where the ZIP file is saved and extract its contents.
4. Copy the extracted folder and paste it into the AWS CodeCommit repository folder that we cloned in the previous lecture.
5. Open Git Bash and navigate to the repository using the following commands:
   ```bash
   ls
   cd <to the master branch>
   ```

Confirm that you are on the master branch using:
   ```bash
   git status
   ```
Add the new files to the staging area:
   ```bash
   git
   ```
Commit the changes:
   ```bash
   git commit -m "Added vulnerable application"
   ```
Push the changes to the CodeCommit repository:
   ```bash
   git push
   ```
### Verifying Changes on AWS CodeCommit
1. Switch to the AWS CodeCommit repository in the AWS console.
2. Ensure that the correct branch (in this case, Master) is selected.
3. Confirm that the files from the vulnerable application are visible in the repository.


