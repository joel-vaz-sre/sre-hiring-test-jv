provider "aws" {
    region = "us-east-1"
}

resource "aws_s3_bucket" "terraform_state" {
    bucket = "terraform-state-aircall"

    lifecycle {
        prevent_destroy = true
    }

    versioning {
        enabled = true
    }

    server_side_encryption_configuration {
        rule {
            apply_server_side_encryption_by_default {
                sse_algorithm = "AES256"
            }
        }
    }
    tags = {
        Project        = "Aircall Hiring"
        Environment    = "Dev"
        Purpose        = "image_resize"
    }
}

resource "aws_dynamodb_table" "terraform_locks" {
    name = "terraform-state-locking"
    billing_mode = "PAY_PER_REQUEST"
    hash_key = "LockID"

    attribute {
        name = "LockID"
        type = "S"
    }
}

resource "aws_s3_bucket" "image_resize" {
    bucket = "aircall-image-resize-bucket"

    tags = {
        Project        = "Aircall Hiring"
        Environment    = "Dev"
        Purpose        = "image_resize"
    }
}

resource "aws_s3_bucket" "lambda_logs_bucket" {
    bucket = "aircall-image-resizer-logs-bucket"

    tags = {
        Project        = "Aircall Hiring"
        Environment    = "Dev"
        Purpose        = "image_resize"
    }
}

resource "aws_ecr_repository" "ecr_lambda_package" {
    name                 = "aircall-ecr-lambda"
    image_tag_mutability = "MUTABLE"

    image_scanning_configuration {
        scan_on_push = true
    }

    tags = {
        Project        = "Aircall Hiring"
        Environment    = "Dev"
        Purpose        = "image_resize"
    }
}

resource "aws_iam_role" "iam_for_lambda" {
    name = "iam-for-lambda"

    assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": "sts:AssumeRole",
            "Principal": {
                "Service": "lambda.amazonaws.com"
            },
            "Effect": "Allow",
            "Sid": ""
        }
    ]
}
EOF
}

resource "aws_lambda_function" "aircall_image_resizer" {
    # If the file is not in the current working directory you will need to include a
    # path.module in the filename.
    image_uri     = var.imageURI
    package_type  = "Image"
    function_name = "aircall-image-resizer"
    role          = aws_iam_role.iam_for_lambda.arn
    description   = "Given an image, returns the image resized on an S3 bucket"
    publish       = true
    timeout       = 10
    environment {
        variables = {
            S3_BUCKET = "aircall-image-resize-bucket"
        }
    }

    tags = {
        Project        = "Aircall Hiring"
        Environment    = "Dev"
        Purpose        = "image_resize"
    }
}

resource "aws_lambda_permission" "aircall_resize_lambda_permission" {
    function_name = aws_lambda_function.aircall_image_resizer.function_name
    action        = "lambda:InvokeFunction"
    statement_id  = "AllowExecutionFromAPIGateway"
    principal     = "apigateway.amazonaws.com"
}
