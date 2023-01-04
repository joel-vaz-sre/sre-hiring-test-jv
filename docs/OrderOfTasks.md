# Introduction 

This small document describes the thinking process behind the development of this challenge.

# Summary

Looking at the challenge the following tasks became obvious:

    - Create an AWS account and users/groups
        - One root user;
        - One IAM user member of an admin group (This was super permissive but I'm the only planned user for this cloud space);
        - One service account user for github actions with pipeline access and at least the following resources:
        - AWS Lambda;
          - Need to have the docker image on a registry accessible by the aws lambda (e.g. ECR (elastic container registry))
        - AWS S3 bucket;
        - Also essential to ensure this user secrets were not exposed during CI/CD process;

    - Create a CI/CD pipeline using github actions for landing zone provisioning on AWS
        - Start by developing locally using Terraform and then adapt what is needed into a pipeline solution;
        - Create draw.io diagram of landing the zone to keep a visual of the cloud space;
        - Would be nice to have some kind of scanning for the terraform code (Explore Snyk integration with Github Actions);

    - Provision the basic infrastructure and remember the S3 bucket for the terraform state file.
        - 1 bucket S3 for terraform state file / dynamoDB configuration for terraform lock state
        - 1 bucket S3 for the image storage
        - 1 Lambda function
        - 1 ECR for the docker image of the function (package)
        - 1 API Gateway to expose application
        - IAM / Access policies / Secure communication between github and AWS

    - Containerize the application using docker;

    - Deploy locally the lambda function to discover what is needed on cloud space;
        - In terms of networking especially;
        - https://docs.aws.amazon.com/lambda/latest/dg/gettingstarted-package.html

    - Create CI/CD pipeline process for re-Deployment of the application;
        - Understand the deployment process and what can be improved/automated;

    - Test the full final solution;
      - Update documentation if needed.

    - Create the tracing/log system;
      - Explore AWS solution for this and how to provide quick and easy to access outputs for this topics.
      - Main Logging: Cloud Watch (can be exported into S3 bucket)

    - Deliver solution.
      - Update documentation.
      - Ensure access is possible for reviewers.
