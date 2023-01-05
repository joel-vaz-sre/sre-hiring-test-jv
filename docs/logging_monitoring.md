# Summary

Small description of the logging and monitoring configuration.

## Logging and Monitoring
The logging and monitoring can be seen in full detail on Cloudwatch for both the API Gateway and the Lambda function.
It is possible but not on the scope of this project to integrate with services like datadog.

In order to provide samples of logging events there was provided an S3 bucket with some log outputs from the lambda function [link](key.s3)

## Current features that are logged by CloudWatch: 

1. Lambda Function; 
2. API Gateway

## Example Monitoring

![Prescreen API Gateway](/printscreens/api_gateway_metrics.png "API Gateway")
![Prescreen Lambda Function](/printscreens/lambda_metrics.png "Lambda Function")
