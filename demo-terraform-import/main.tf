resource "aws_s3_bucket" "kthamel-cloud-automation-tfimport" {
  bucket = "kthamel-cloud-automation-tfimport"

  tags = {
    Project = "IAC-Project"
  }
}