# output "general-output-message" {
#   description = "printing output message"
#   value       = "Hello World"
# }

output "new_s3_bucket-name_is" {
  description = "printing the newly created bucket name"
  value       = aws_s3_bucket.a-new-s3-bucket.id
}
