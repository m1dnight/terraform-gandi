terraform {
  required_providers {
    gandi = {
      source  = "go-gandi/gandi"
      version = "2.3.0"
    }
  }
}


variable "gandi_key_m1dnight" {
  type      = string
  default   = "default-value"
  nullable  = false
  sensitive = true
}

variable "gandi_key_callcc" {
  type      = string
  default   = "default-value"
  nullable  = false
  sensitive = true
}

data "external" "public_ip" {
  program = ["bash", "-c", "printf '{\"ip\":\"%s\"}' $(curl -s https://ipinfo.io/ip)"]
}

locals {
  public_ip = data.external.public_ip.result.ip
}

output "public_ip" {
  value = data.external.public_ip.result
  description = "Current public IP address"
}

provider "gandi" {
  alias                 = "m1dnight"
  personal_access_token = var.gandi_key_m1dnight
}

provider "gandi" {
  alias                 = "callcc"
  personal_access_token = var.gandi_key_callcc
}
