FROM amazon/aws-lambda-nodejs:14

COPY serverless/*.js serverless/package*.json  ${LAMBDA_TASK_ROOT}/

RUN npm install

RUN npm audit fix

ENV S3_BUCKET=aircall-image-resize-bucket

CMD [ "app.lambdaHandler" ] 
