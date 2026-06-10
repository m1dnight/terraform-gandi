terraform {
  required_providers {
    gandi = {
      source  = "go-gandi/gandi"
      version = "2.3.0"
    }
    onepassword = {
      source  = "1Password/onepassword"
      version = "~> 2.1"
    }
  }
}

provider "onepassword" {
  service_account_token = var.op_service_account_token
}

#  op service-account create terraform --expires-in 1w --vault Infra:read_items
variable "op_service_account_token" {
  type      = string
  sensitive = true
}

data "onepassword_item" "gandi" {
  vault = "Infra"
  title = "Gandi call-cc.be"
}

provider "gandi" {
  personal_access_token = data.onepassword_item.gandi.credential
}
