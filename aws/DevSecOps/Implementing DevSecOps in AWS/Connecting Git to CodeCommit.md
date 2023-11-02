# Connecting Git Bash with AWS CodeCommit

## Introduction

In this tutorial, we will learn how to create a new CodeCommit repository and connect Git Bash with CodeCommit. By the end of this tutorial, you will be able to clone CodeCommit repositories to your local system, push files from your local system to CodeCommit, and pull files from CodeCommit to your local system.

## Steps

### 1. Create a New Repository

- Navigate to the CodeCommit dashboard.
- Click on "Get Started" and select "Create a New Repository."
- Name the new repository (e.g., "DevSecOps-Repo") and click "Create."

### 2. Install Git

- Download Git for your operating system from the provided URL.
- Choose the appropriate 32-bit or 64-bit version based on your system.
- Install Git by following the installer's prompts.

### 3. Configure Git

- After installing Git, you can find Git Bash in your Windows search.
- Open Git Bash.

### 4. Connect Git with CodeCommit

- Create an IAM user with CodeCommit permissions.
  - Go to the AWS IAM service.
  - Click on "Users."
  - Click "Add users" and set a username (e.g., "DevSecOp-User").
  - Select "Programmatic Access" and "AWS Management Console access."
  - Attach policies directly and search for "CodeCommit" and attach the `CodeCommitFullAccess` policy
  - Review and create the user.

### 5. Generate IAM User Credentials

- After creating the user, go back to IAM and click on the user.
- In the user details, go to "Security credentials."
- Scroll down to find `HTTPS Git Credentials for AWS CodeCommit`
- Click "Generate Credentials" to get a username and password.
- The Download the credentials

### 6. Clone the Repository

- Open Git Bash and navigate to the folder where you want to clone the repository.
- Right-click while holding "Shift" and select "Git Bash here." If not visible,
- Go to CodeCommit and on the repo click Clone URl for `HTTPS`
- Then paste it into the Git Bash termina and press enter. 




