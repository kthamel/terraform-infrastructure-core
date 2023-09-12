resource "random_password" "password" {
  keepers = {
    datetime = timestamp()
  }
  length  = 10
  special = false
  upper   = false
  lower   = true
  numeric = true
}

output "password-value" {
  value     = random_password.password.id
  sensitive = true
}
