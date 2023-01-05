# Summary

Small description of the logging and monitoring configuration.

## Logging and Monitoring
The logging and monitoring can be seen in full detail on Cloudwatch for both the API Gateway and the Lambda function.
It is possible but not on the scope of this project to integrate with services like datadog.

In order to provide samples of logging events there was provided an S3 bucket with some log outputs from the lambda function [link](key.s3)

## Current features that are logged by CloudWatch: 

1. Lambda Function; 
2. API Gateway

## Example Logs

The following print screens are an exemplification of what is being logged per event on the cloud watch platform.
![Prescreen API Gateway Logs](printscreens/cloud_watch_api_gateway_logs.png "API Gateway")
Logs for the API gateway events.

![Prescreen Lambda Function Logs](printscreens/cloud_watch_lambda_logs.png "Lambda Function")
Logs for a successful execution of the function.

## Example Monitoring

The following print screens are an exemplification of what is being monitored on the AWS platform for the API gateway and the lambda function.
![Prescreen API Gateway Metrics](printscreens/api_gateway_metrics.png "API Gateway")
Metrics of usage for the API Gateway.

![Prescreen Lambda Function Metrics](printscreens/lambda_metrics.png "Lambda Function")
Metrics of usage for the Lambda function.

## Integration with S3 Bucket

Cloudwatch has a task that sends logs into an S3 bucket for easier access. The current access type for this bucket is "public-read" which is not ideal but was chosen for demonstration purposes.

Bucket URL for one object: https://aircall-image-resizer-logs-bucket.s3.amazonaws.com/lambda-logs/248945c1-c71f-430b-ab6b-fd7c9a249ef9/2023-01-04-%5B%24LATEST%5D072bee4bd47f46eca4e9a0ced9e998d7/000000.gz

There are multiple objects as expected in a log bucket, it is a possibility to make this bucket as a static website for easier access to the contents but this was not in the scope of this challenge. Note: https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket#static-website-hosting
