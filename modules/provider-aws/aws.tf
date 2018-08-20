provider "aws" {
    access_key = "${var.aws_access_key}"
    secret_key = "${var.aws_secret_key}"
    region = "${var.aws_region}"
    # notice after terraform init with s3 backend
    # To prevent automatic upgrades to new major versions that may contain breaking
    # changes, it is recommended to add version = "..." constraints to the
    # corresponding provider blocks in configuration, with the constraint strings
    # suggested below.
    # * provider.aws: version = "~> 1.22"
    version = "~> 1.22"
}
