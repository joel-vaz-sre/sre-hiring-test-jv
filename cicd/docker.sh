####
##
##  This shell script uploads the docker image of the Application into the AWS ECR (Elastic Container Registry)
##  Also adds the correct TAG to the docker image
##
####

#### THIS VARS NEED TO BE ON GIT in order to be used on the pipeline
export AWS_ID=$1
export REGION=$2
export APPLICATION_NAME=$3

echo "Logging into ECR"
aws ecr get-login-password --region $REGION | docker login --username AWS --password-stdin $AWS_ID.dkr.ecr.$REGION.amazonaws.com
echo "Success.. Build Docker Image"
cd .. && docker build -t ${APPLICATION_NAME} .
echo "Success.. Applying tag to image"
docker tag ${APPLICATION_NAME}:latest $AWS_ID.dkr.ecr.$REGION.amazonaws.com/${APPLICATION_NAME}:latest
echo "Success.. Pushing new image into ecr"
docker push $AWS_ID.dkr.ecr.$REGION.amazonaws.com/${APPLICATION_NAME}:latest
echo "Image successfully pushed"
