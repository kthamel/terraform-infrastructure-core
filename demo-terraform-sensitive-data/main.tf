resource "random_string" "rand-string-1" {
  length = 16
  numeric = true
  lower = true
  upper = true
  special = false 
}

resource "random_string" "rand-string-2" {
  length = 16
  numeric = true
  lower = true
  upper = true
  special = false 
}

output "random_string-1" {
  value = random_string.rand-string-1
  sensitive = false
}

output "random_string-2" {
  value = random_string.rand-string-2
  sensitive = true
}
