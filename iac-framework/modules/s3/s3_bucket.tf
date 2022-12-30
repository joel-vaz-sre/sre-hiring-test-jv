resource "aws_s3_bucket" "this" {
  
  bucket = var.custom_name
  acl    = var.acl

  tags = var.tags

  versioning {
    enabled    = var.versioning_enabled
    mfa_delete = var.mfa_delete
  }

  dynamic "object_lock_configuration" {
    for_each = var.object_lock_configuration ? ["enabled"] : []

    content {
      object_lock_enabled = "Enabled"
    }
  }

  dynamic "logging" {
    for_each = var.logging

    content {
      target_bucket = logging.value.target_bucket
      target_prefix = logging.value.target_prefix
    }
  }
}
