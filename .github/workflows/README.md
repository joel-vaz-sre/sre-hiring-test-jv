# Summary

Github actions for the Aircall challenge.

1. Infrastructure provisioning pipeline in order to deploy infrastructure such as the initial landing zone.
   1. It is possible to integrate this pipeline with additional features such as terraform code testing, snyk integration and so forth.
2. Image Resize CICD pipeline, this is a product development pipeline that updates the product deployed. It is meant to be used when changes to the lambda function are to be performed by a product developer. This pipeline is configured to deploy into the ECR (Elastic container registry).
   1. Unit and integration testing should be added here.
   2. Deployment strategies are to be included here (how to deploy the function, how to separate between environments, ..).

# AWS Authentication

Github actions were authenticated to access AWS resources via a temporary access role with limited access and authenticated using OpenId connect.
