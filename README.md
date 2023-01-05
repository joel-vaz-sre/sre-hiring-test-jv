# Aircall.io - DevOps technical test

This test is a part of our hiring process at Aircall for [DevOps positions](https://aircall.io/jobs#SystemAdministrator). It should take you between 1 and 6 hours depending on your experience.

__Feel free to apply! Drop us a line with your Linkedin/Github/Twitter/AnySocialProfileWhereYouAreActive at jobs@aircall.io__


## Summary

An intern in our team has developed an application to resize images. It's working fine.

Unfortunately, he left the company and we have no documentation or no insights at all about
what he did.

We just have the code.

With the following request to the application, the image is resized, stored and accessible from s3.

```
curl --location --request POST 'http://resize.aircall.com/image' \
--form 'file=@img.jpg' \
--form 's3Key=img.jpg'
```

The provided code is working. 

It seems that our intern was using something called Lambda. Don't know what is it.



## What we want ?
Could you please take this code, and deploy it on AWS in a cool way?

Please, make Infra as Code because I heard that it's cool to do so.

You can also make some diagrams if needed.

Technically speaking, we need to get:

- Application URL (https://x6e08g4sx2.execute-api.us-east-1.amazonaws.com/resize/image)
- URL of the resized images (s3 presigned URL [todo])
- GitHub repo (https://github.com/joel-vaz-sre/sre-hiring-test-jv)

## Good to know

- packages have to be builded from a linux platform (docker is your friend)
- input is not a JSON but a form data (multipart/form-data)

## Nice to have

- logs (CloudWatch read documentation on docs/Logging_Monitoring.md)
- tracing (CloudWatch - example in docs/printscreens)
- deployment framework (.github via github actions and cicd folder, landing zone created via terraform on automated pipeline)
- CI/CD (.github via github actions)
- auth (github uses a iam role for programmatic limited access, no auth was provided for the API endpoints)

Good luck !
