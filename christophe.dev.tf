locals {
  christophe_dev_records = {
    apex_a = {
      name = "@"
      type = "A"
      ttl  = 1080
      values = [
        "199.36.158.100",
      ]
    }
    apex_mx = {
      name = "@"
      type = "MX"
      ttl  = 10800
      values = [
        "10 spool.mail.gandi.net.",
        "50 fb.mail.gandi.net.",
      ]
    }
    apex_txt = {
      name = "@"
      type = "TXT"
      ttl  = 1800
      values = [
        "\"v=spf1 include:_mailcust.gandi.net ?all\"",
      ]
    }
    _acme-challenge_txt = {
      name = "_acme-challenge"
      type = "TXT"
      ttl  = 10800
      values = [
        "\"HuAAjvzHzgjBFjznNH02la3-8jFV8tO8sOsa1YOPdCU\"",
      ]
    }
    blog_cname = {
      name = "blog"
      type = "CNAME"
      ttl  = 10800
      values = [
        "blogs.vip.gandi.net.",
      ]
    }
    gm1__domainkey_cname = {
      name = "gm1._domainkey"
      type = "CNAME"
      ttl  = 1200
      values = [
        "gm1.gandimail.net.",
      ]
    }
    gm2__domainkey_cname = {
      name = "gm2._domainkey"
      type = "CNAME"
      ttl  = 1200
      values = [
        "gm2.gandimail.net.",
      ]
    }
    gm3__domainkey_cname = {
      name = "gm3._domainkey"
      type = "CNAME"
      ttl  = 1200
      values = [
        "gm3.gandimail.net.",
      ]
    }
    webmail_cname = {
      name = "webmail"
      type = "CNAME"
      ttl  = 10800
      values = [
        "webmail.gandi.net.",
      ]
    }
  }
}

resource "gandi_livedns_record" "christophe_dev" {
  provider = gandi.m1dnight
  for_each = local.christophe_dev_records

  zone = "christophe.dev"

  name   = each.value.name
  ttl    = each.value.ttl
  type   = each.value.type
  values = each.value.values
}
