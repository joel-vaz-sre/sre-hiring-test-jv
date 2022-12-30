#terraform {
#  backend "s3" {
#    bucket         = "terraform-state-bucket"
#    dynamodb_table = "tfstate-us-east-1"
#    encrypt        = true
#    key            = "terraform.tfstate"
#    region         = "us-east-1"
#  }
#}
