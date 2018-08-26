#
resource "aws_kms_key" "s3_be_key" {
  description             = "This key is used to encrypt bucket objects"
  deletion_window_in_days = 10
}
