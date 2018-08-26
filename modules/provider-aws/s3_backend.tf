# ref.:
# https://www.terraform.io/docs/providers/aws/r/s3_bucket.html
# https://www.terraform.io/docs/providers/aws/r/s3_bucket_policy.html
# https://docs.aws.amazon.com/AmazonS3/latest/dev/bucket-encryption.html
# https://docs.aws.amazon.com/AmazonS3/latest/dev/access-policy-language-overview.html
# https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_elements_principal.html

resource "aws_s3_bucket" "s3_backend" {
  bucket = "${var.s3_backend_name}"
  acl    = "private"
  region = "${var.aws_region}"

  tags {
    Name        = "terraform state"
    Environment = "Prod"
  }

  versioning {
    enabled = true
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = "${aws_kms_key.s3_be_key.arn}"
        sse_algorithm     = "aws:kms"
      }
    }
  }
}

data "aws_iam_policy_document" "s3_backend_policy" {
  statement {
    sid = "terraform s3 backend policy"

    actions = [
      "s3:GetObject",
      "s3:PutObject",
      "s3:ListBucket",
    ]

    resources = [
      "arn:aws:s3:::tf-remote-be/*",
      "arn:aws:s3:::tf-remote-be/terraform.tfstate",
      "arn:aws:s3:::tf-remote-be"
    ]
    principals {
      type        = "AWS"
      identifiers = ["${var.s3_backend_policy_role_arn}"]
      }
  }
}

resource "aws_s3_bucket_policy" "s3_backend" {
  bucket = "${aws_s3_bucket.s3_backend.id}"
  policy = "${data.aws_iam_policy_document.s3_backend_policy.json}"
}
