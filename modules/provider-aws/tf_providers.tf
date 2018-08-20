terraform {
    backend "s3" {}
}

data "terraform_remote_state" "remote" {
  backend = "s3"
  config {
    bucket = "${var.s3_backend_name}"
    key    = "terraform.tfstate"
    region = "${var.aws_region}"
  }
}
