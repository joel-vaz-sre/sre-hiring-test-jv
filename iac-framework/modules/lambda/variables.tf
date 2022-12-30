variable "filename" {
  description = "Path to the function's deployment package."
  type        = string
}

variable "function_name" {
  description = "Function unique name on AWS"
  type        = string
}

variable "handler" {
  description = "Function entrypoint in your code."
  type        = string
}

variable "publish" {
  description = "(Optional) Whether to publish creation/change as new Lambda Function Version. Defaults to false."
  default     = false
  type        = bool
}

variable "runtime" {
  description = "Identifier of the function's runtime. See [Runtimes](https://docs.aws.amazon.com/lambda/latest/dg/API_CreateFunction.html#SSS-CreateFunction-request-Runtime) for valid values."
  default     = "python3.9"
  type        = string
}

variable "source_code_hash" {
  description = "Used to trigger updates. Must be set to a base64-encoded SHA256 hash of the package file specified with either filename or s3_key."
  type        = string
}

variable "memory" {
  default     = 128
  description = "(Optional) Amount of memory in MB your Lambda Function can use at runtime."
  type        = number
}
