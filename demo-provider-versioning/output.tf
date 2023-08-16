output "random-passwd" {
  description = "Printing the random password"
  value       = random_string.random_passwd.id
}