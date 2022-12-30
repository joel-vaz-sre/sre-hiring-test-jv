provider "aws" {
  region = "us-east-1"
}

module "s3_bucket" {
  source              = "./modules/s3"
}
