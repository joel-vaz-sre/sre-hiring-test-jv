Lambda Module
===========

This module provides the creation of lambda functions

## Usage

```hcl
data "image_resize" "function" {
  type        = "Docker"
  source_file = format("URL input", path.module)
  output_path = format("s3 bucket path", path.module)
}

module "partners" {
  source = "git::git@github.com:Talkdesk/terraform-compute-modules.git//aws/lambda/generic_general?ref=22.04.02"

  region      = var.region

  filename         = data.archive_file.function.output_path
  source_code_hash = data.archive_file.function.output_base64sha256

  handler = "function.lambda_handler"

  publish = true
}
```

<!-- TFDOC_START -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13, < 2 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3, < 4 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 3, < 4 |

## Modules

| Name | Source | 
|------|--------|
| <a name="module_tags"></a> [tags](#module\_tags) | modules/lambda |

## Resources

| Name | Type |
|------|------|
| [aws_lambda_function.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_function) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_filename"></a> [filename](#input\_filename) | Path to the function's deployment package within the local filesystem. | `string` | n/a | yes |
| <a name="input_handler"></a> [handler](#input\_handler) | Function entrypoint in your code. | `string` | n/a | yes |
| <a name="input_source_code_hash"></a> [source\_code\_hash](#input\_source\_code\_hash) | Used to trigger updates. Must be set to a base64-encoded SHA256 hash of the package file specified with either filename or s3\_key. | `string` | n/a | yes |
| <a name="input_memory"></a> [memory](#input\_memory) | (Optional) Amount of memory in MB your Lambda Function can use at runtime. | `number` | `128` | no |
| <a name="input_publish"></a> [publish](#input\_publish) | (Optional) Whether to publish creation/change as new Lambda Function Version. Defaults to false. | `bool` | `false` | no |
| <a name="input_runtime"></a> [runtime](#input\_runtime) | Identifier of the function's runtime. See [Runtimes](https://docs.aws.amazon.com/lambda/latest/dg/API_CreateFunction.html#SSS-CreateFunction-request-Runtime) for valid values. | `string` | `"python3.9"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | n/a |
| <a name="output_qualified_arn"></a> [qualified\_arn](#output\_qualified\_arn) | n/a |

<!-- TFDOC_END -->
