variable "public_key_path" {}

variable "key_name" {}

variable "aws_region" {}

// Variables for providers used in this module
variable "aws_access_key" {}
variable "aws_secret_key" {}

# Ubuntu Server 16.04 LTS (HVM), SSD (x64)
variable "aws_amis" {}

# s3 backend policy
variable "s3_backend_name" {}
variable "s3_backend_policy_role_arn" {}
