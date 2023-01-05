# Summary

Bellow is a list of tasks that would add value to the project but were not implemented.

1. Add pipeline terraform code testing to infrastructure provisioning pipeline:
   1. e.g. ![checkov](https://www.checkov.io/)
2. Add pipeline integration with Snyk for container scanning (package) and code quality;
3. Refactor terraform code for better code quality
   1. If needed implement terraform modules for repeated resources (e.g. S3 bucket);
4. Explore serverless yml solution as terraform might not be the best option to provision serverless infrastructure
   1. https://www.serverless.com/framework/docs/providers/aws/guide/serverless.yml
