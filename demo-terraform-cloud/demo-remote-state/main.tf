resource "aws_s3_bucket" "test-bucket" {
  bucket = "kthamel-dev-bucket"

  tags = {
    Provisioned_By = "kthamel"
  }
}

output "print_bucket_name" {
  value = aws_s3_bucket.test-bucket.id
}
