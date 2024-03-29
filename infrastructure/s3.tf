resource "aws_s3_bucket" "dl" {
  bucket = "datalake-dlhdlemr-tf"
  acl    = "private"

  tags = {
    PROJECT = "dlhdlemr"
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}