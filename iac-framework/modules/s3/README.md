# S3 module

This module provides creation of an bucket for generic public purposes

## Usage

```hcl
module "s3" {
  source = "/modules/s3"

  bucket                     = var.custom_name
  acl                        = var.acl
  versioning_enabled         = var.versioning_enabled
}
```

<!-- TFDOC_START -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13, < 2 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 2.70 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 2.70 |

## Modules

| Name | Source |
|------|--------|
| <a name="modules"></a> [tags](#module\_tags) | /modules/s3 |

## Resources

| Name | Type |
|------|------|
| [aws_s3_bucket.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_metric.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_metric) | resource |
| [aws_kms_alias.aws_s3](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/kms_alias) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_acl"></a> [acl](#input\_acl) | The canned ACL to apply. - https://docs.aws.amazon.com/AmazonS3/latest/dev/acl-overview.html#canned-acl | `string` | `"private"` | no |
| <a name="input_custom_name"></a> [custom\_name](#input\_custom\_name) | Bucket name | `string` | `null` | no |
| <a name="input_logging"></a> [logging](#input\_logging) | A settings of bucket logging | `list(map(string))` | `[]` | no |
| <a name="input_object_lock_configuration"></a> [object\_lock\_configuration](#input\_object\_lock\_configuration) | Enable object lock configuration | `bool` | `false` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Map of tags to append to Subnet tags | `map(string)` | `{}` | no |
| <a name="input_versioning_enabled"></a> [versioning\_enabled](#input\_versioning\_enabled) | Enable versioning. Once you version-enable a bucket, it can never return to an unversioned state. You can, however, suspend versioning on that bucket | `bool` | `false` | no |
| <a name="input_versioning_mfa_delete"></a> [versioning\_mfa\_delete](#input\_versioning\_mfa\_delete) | Enable MFA delete for either Change the versioning state of your bucket or Permanently delete an object version | `bool` | `false` | no |
| <a name="input_website"></a> [website](#input\_website) | A website object | `list(map(string))` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_bucket"></a> [bucket](#output\_bucket) | Bucket details |

<!-- TFDOC_END -->
