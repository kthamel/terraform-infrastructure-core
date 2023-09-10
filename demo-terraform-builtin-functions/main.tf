locals {
  minimum = min(var.number-01, var.number-02, var.number-03)
  maximum = max(var.number-01, var.number-02, var.number-03)
}

output "minimum-output" {
  description = "print the minimum numeric value"
  value = local.minimum
}

output "maximum-output" {
  description = "print the maximum numeric value"
  value = local.maximum
}
