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
  title = "Gandi call-cc.io"
}

provider "gandi" {
  personal_access_token = data.onepassword_item.gandi.credential
}

resource "gandi_livedns_record" "a_call_cc_io" {
  zone   = "call-cc.io"
  name   = "@"
  type   = "A"
  ttl    = 3600
  values = ["141.134.26.23"]
}

# List of subdomains that are a cname to the A record
variable "subdomains" {
  type    = set(string)
  default = ["*"]
}

# Set all the subdomains
resource "gandi_livedns_record" "cname_subdomains" {
  for_each = var.subdomains
  zone     = "call-cc.io"
  name     = each.value
  type     = "CNAME"
  ttl      = 3600
  values   = ["call-cc.io."]
}
