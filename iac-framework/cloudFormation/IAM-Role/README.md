# Summary

As a test I decided to use cloud formation for the creation of the federated access between github actions and the AWS resources. 
This connection uses the openIDC technology in order to guarantee additional safety.

Note: 
The permission is not restrictive enough as it is, needs to be refined further for additional security and limited access.
Permissions need to be refined in both **Action** and **Scope**

Note2:
It is a good practice in my view to have one github actions role per workflow with only essential permissions for each workflow. That is, on the CI/CD workflow there is no need for the github iam role to have access for lambda since it only pushes an image onto a public ECR. To simplify this challenge this was not taken onto account.

# Conclusion

It was my first experience with cloud formation and it proved to be an easy to use tool, I will need to explore further how to "deploy" the cloud formation document on the AWS infrastructure. As of now I use an S3 bucket and a apply action.

Cloud formation also proves to be beneficial in terms of configuring serverless applications and the API Gateway itself, since terraform was not very "user-friendly" for that purpose.