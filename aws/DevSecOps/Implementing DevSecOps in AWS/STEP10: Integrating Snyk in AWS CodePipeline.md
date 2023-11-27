# Integrating Snyk in AWS CodePipeline
## Introduction
Welcome to this lecture where we will add a new stage to our AWS CodePipeline and integrate Snyk to perform Software Composition Analysis (SCA). This will enhance our pipeline by incorporating security checks for vulnerabilities in our project dependencies.

## Prerequisites
Ensure you have completed the previous steps, including setting up AWS CodePipeline.

## Adding a Snyk Stage to CodePipeline
Let's proceed with adding a new stage to our CodePipeline for Snyk SCA:

1. Open the AWS Management Console and navigate to CodePipeline.

2. Click on the pipeline you created in the previous lecture (e.g., MyFirstCodePipeline).

3. Click on "Edit."

4. Click on "Add stage."

5. Give the stage a name, such as SnykSCA, and click on "Add Stage."

6. Now, we need to `add an action group` to this stage. Give the action a name, like SCAAnalysisFromSnyk.

7. For "Action provider," choose "Snyk."

8. For "Input artifacts," select your `SourceArtifacts`.

9. Connect to Snyk with your GitHub account. Authorize Snyk to use your GitHub account and create an organization on your behalf.

10. Choose the appropriate options for stopping deployment based on Snyk findings and monitoring behavior.

11. Click on "Continue" and confirm the OAuth request.

12. Provide an output artifact name, such as snykSCAAnalysisOutput, and click on "Done."

13. Save the pipeline.

14. Click on "Release Change" and then "Release."

15. Observe the pipeline build process.

## Reviewing Snyk SCA Analysis Results
- As the pipeline progresses, Snyk will perform SCA analysis on your source code, and you can review the results within the pipeline.

- Once the pipeline build is complete, click on the "SCAAnalysisFromSnyk" action in the pipeline.

- Review the Snyk SCA analysis results.

- The Snyk test report will be generated, and vulnerabilities in your project dependencies will be identified.

## Congratulations! 
You've successfully integrated Snyk SCA analysis into your AWS CodePipeline. This helps ensure that your project dependencies are regularly checked for vulnerabilities as part of your CI/CD process.







