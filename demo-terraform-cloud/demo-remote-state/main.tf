resource "random_string" "demo-random-string" {
    length = 10
    numeric = true
    lower = true
    upper = false
    special = false
}

output "print-random-string" {
  value = random_string.demo-random-string.id
}
