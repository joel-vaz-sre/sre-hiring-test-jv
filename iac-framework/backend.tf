terraform {
  backend "s3" {
    bucket         = "terraform-state-aircall"
    dynamodb_table = "terraform-state-locking"
    encrypt        = true
    key            = "global/s3/terraform.tfstate"
    region         = "us-east-1"
  }
}
