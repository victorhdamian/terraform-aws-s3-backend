  module "aws" {
  source = "../modules/provider_aws"
  public_key_path = "~/.ssh/your_key.pub"
  key_name = "vyour_key"
  aws_region = "us-east-1"
  aws_access_key = "your aws_access_key"
  aws_secret_key = "your aws_secret_key"
  aws_amis = "ami-80861296"
  s3_backend_name = "tf-remote-be"
  s3_backend_policy_role_arn = "your principal arn exp. arn:aws:iam::id#:user/user_name"
}
