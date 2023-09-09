variable "project" {
  type = string

  validation {
    condition = contains(["alpha", "beta", "gamma"], lower(var.project))
    error_message = "please use lower cases for project names"
  }
}
