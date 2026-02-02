locals {
  christophedetroyer_be_records = {
    apex_a = {
      name = "@"
      type = "A"
      ttl  = 10800
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
      ttl  = 10800
      values = [
        "\"v=spf1 include:_mailcust.gandi.net ?all\"",
      ]
    }
    _acme-challenge_txt = {
      name = "_acme-challenge"
      type = "TXT"
      ttl  = 10800
      values = [
        "\"jEtLL4drCg1KqPi6E8Va0cooTZwBppwABeA4pQpg4ms\"",
      ]
    }
    _imap__tcp_srv = {
      name = "_imap._tcp"
      type = "SRV"
      ttl  = 10800
      values = [
        "0 0 0 .",
      ]
    }
    _imaps__tcp_srv = {
      name = "_imaps._tcp"
      type = "SRV"
      ttl  = 10800
      values = [
        "0 1 993 mail.gandi.net.",
      ]
    }
    _pop3__tcp_srv = {
      name = "_pop3._tcp"
      type = "SRV"
      ttl  = 10800
      values = [
        "0 0 0 .",
      ]
    }
    _pop3s__tcp_srv = {
      name = "_pop3s._tcp"
      type = "SRV"
      ttl  = 10800
      values = [
        "10 1 995 mail.gandi.net.",
      ]
    }
    _submission__tcp_srv = {
      name = "_submission._tcp"
      type = "SRV"
      ttl  = 10800
      values = [
        "0 1 465 mail.gandi.net.",
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

resource "gandi_livedns_record" "christophedetroyer_be" {
  provider = gandi.m1dnight
  for_each = local.christophedetroyer_be_records

  zone = "christophedetroyer.be"

  name   = each.value.name
  ttl    = each.value.ttl
  type   = each.value.type
  values = each.value.values
}
