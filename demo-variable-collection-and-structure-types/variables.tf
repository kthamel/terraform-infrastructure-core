variable "environment" {
  type = string
  default = "dev"
}

## List string type variable ##
variable "region" {
  description = "allowed regions"
  type = list(string)
  default = [
    "us-east-1",
    "us-east-2"
  ]
}

## Map type variable ##
variable "cidr_block" {
  type = map(string)
  default = {
    dev = "172.32.0.0/16"
    prod = "172.40.0.0/16"
  }
}

variable "avaiability_zone" {
  type = map(string)
  default = {
    dev = "us-east-1a"
    prod = "us-east-2a"
  }
}

variable "ip_ranges" {
  type = map(string)
  default = {
    dev = "172.32.0.0/24"
    prod = "172.40.0.0/24"
  }
}