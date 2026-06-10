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

# --- A records ---

# Public IP the A records point to
variable "public_ip" {
  type    = string
  default = "141.134.26.23"
}

resource "gandi_livedns_record" "a_call_cc_be" {
  zone   = "call-cc.be"
  name   = "@"
  type   = "A"
  ttl    = 1080
  values = [var.public_ip]
}

resource "gandi_livedns_record" "a_internal_wildcard" {
  zone   = "call-cc.be"
  name   = "*.internal"
  type   = "A"
  ttl    = 1080
  values = [var.public_ip]
}

# --- Mail: Google Workspace MX ---

resource "gandi_livedns_record" "mx" {
  zone = "call-cc.be"
  name = "@"
  type = "MX"
  ttl  = 10800
  values = [
    "1 aspmx.l.google.com.",
    "5 alt1.aspmx.l.google.com.",
    "5 alt2.aspmx.l.google.com.",
    "10 alt3.aspmx.l.google.com.",
    "10 alt4.aspmx.l.google.com.",
  ]
}

# --- TXT records ---

resource "gandi_livedns_record" "txt_root" {
  zone = "call-cc.be"
  name = "@"
  type = "TXT"
  ttl  = 3600
  values = [
    "\"google-site-verification=CQN0Y8J_4L4RCZVRljmRglZQnznJzqduFx2AI7DUMjM\"",
    "\"google-site-verification=aEfSRr4XWhCLkT6wmcHj8w1s_6F59Ddk4dwJ34-9rMs\"",
    "\"v=spf1 include:_spf.google.com ~all\"",
  ]
}

# Postmark DKIM
resource "gandi_livedns_record" "txt_postmark_dkim" {
  zone   = "call-cc.be"
  name   = "20240123170015pm._domainkey"
  type   = "TXT"
  ttl    = 10800
  values = ["\"k=rsa;p=MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCSSjyeM3GHhG+qt3F5+SDisclx/KR1ZC4Lk/pt0Rf+QFXKYRNScMG/1/c+/ghEDEsfLqj3dgerxlC8U6USScJSyOMxuMRyXEgbZQzZGq\" \"2AsoSqJWtig8JKXL/IeTm2EjW++vKsW2MAr+abTiU7CuaazGb8RPvcc9SfeghHQmNBFQIDAQAB\""]
}

# Bluesky handle verification
resource "gandi_livedns_record" "txt_atproto" {
  zone   = "call-cc.be"
  name   = "_atproto"
  type   = "TXT"
  ttl    = 10800
  values = ["\"did=did:plc:obsvrzrrxst63dvc4zu2zaik\""]
}

# --- CNAME records ---

locals {
  cnames = {
    # Gandi mail
    "gm1._domainkey" = { ttl = 1200, value = "gm1.gandimail.net." }
    "gm2._domainkey" = { ttl = 1200, value = "gm2.gandimail.net." }
    "gm3._domainkey" = { ttl = 1200, value = "gm3.gandimail.net." }
    "imap"           = { ttl = 10800, value = "access.mail.gandi.net." }
    "pop"            = { ttl = 10800, value = "access.mail.gandi.net." }
    "smtp"           = { ttl = 10800, value = "relay.mail.gandi.net." }
    "webmail"        = { ttl = 10800, value = "webmail.gandi.net." }

    # Postmark bounce domain
    "pm-bounces" = { ttl = 10800, value = "pm.mtasv.net." }

    # Sectigo/Comodo certificate validation
    "33f034812dca424364df7d6cd606cb5f.www" = { ttl = 10800, value = "6103a042790a0681b92f24906e453c7b7e874e40.comodoca.com." }
    "8f630182d86f50b4fd7ec8d725833f8c.www" = { ttl = 10800, value = "64d876a2579d206a929fd5d5b951fca90b2713eb.comodoca.com." }
  }
}

resource "gandi_livedns_record" "cname" {
  for_each = local.cnames
  zone     = "call-cc.be"
  name     = each.key
  type     = "CNAME"
  ttl      = each.value.ttl
  values   = [each.value.value]
}
