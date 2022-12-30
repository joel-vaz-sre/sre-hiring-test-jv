resource "aws_lambda_function" "this" {
  filename      = var.filename
  function_name = var.function_name
  handler       = var.handler

  source_code_hash = var.source_code_hash

  publish = var.publish

  runtime = var.runtime

  memory_size = var.memory

}
