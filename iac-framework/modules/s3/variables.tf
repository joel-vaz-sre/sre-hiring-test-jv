variable "acl" {
  default     = "private"
  description = "The canned ACL to apply. Defaults to \"private\" - https://docs.aws.amazon.com/AmazonS3/latest/dev/acl-overview.html#canned-acl"
  type        = string
}

variable "custom_name" {
  default     = null
  description = "Bucket name"
  type        = string
}

variable "logging" {
  default     = []
  description = "Settings of bucket logging"
  type        = list(map(string))
}

variable "object_lock_configuration" {
  default     = false
  description = "Enable object lock configuration"
  type        = bool
}

variable "tags" {
  default     = {}
  description = "Map of tags to append"
  type        = map(string)
}

variable "versioning_enabled" {
  default     = false
  description = "Enable versioning. Once you version-enable a bucket, it can never return to an unversioned state. You can, however, suspend versioning on that bucket"
  type        = bool
}

variable "versioning_mfa_delete" {
  default     = false
  description = "Enable MFA delete for either Change the versioning state of your bucket or Permanently delete an object version"
  type        = bool
}

variable "website" {
  default     = []
  description = "A website object"
  type        = list(map(string))
}
