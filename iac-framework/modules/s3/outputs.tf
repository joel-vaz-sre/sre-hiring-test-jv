output "bucket" {
  description = "Bucket details"
  value = {
    arn  = aws_s3_bucket.this.arn
    name = aws_s3_bucket.this.id
  }
}
