#!/bin/sh

####
##
##  Infrastructure Provisioning Scripts
##
####
export S3_CloudFomration_Bucket=$1
cd ..
cd iac-framework/
terraform init
terraform plan -no-color -input=false -out tfplan .
terraform apply -auto-approve tfplan

cd cloudFormation/IAM-Role
aws s3 cp githubRole.yml s3://${S3_CloudFomration_Bucket}
