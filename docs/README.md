## Introduction

This folder has the documentation needed to describe the cloud architecture, features and processes for the Image resize application using AWS.


## How to run

Endpoint: https://x6e08g4sx2.execute-api.us-east-1.amazonaws.com/resize/image

Curl command:
'''
curl -X POST 'https://x6e08g4sx2.execute-api.us-east-1.amazonaws.com/resize/image' --form 'file=@Aircall.jpg' --form 's3Key=Aircall_resized.jpg'
'''

Public Repository: [Github](https://github.com/joel-vaz-sre/sre-hiring-test-jv)
