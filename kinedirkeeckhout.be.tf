locals {
  kinedirkeeckhout_be_records = {
    apex_a = {
      name = "@"
      type = "A"
      ttl  = 1800
      values = [
        "151.101.1.195",
        "151.101.65.195",
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
        "\"google-site-verification=8g9Yw4CkJw1PxwTN2-RYUmSxgUTCyqEVgpw_LJzlQs0\"",
        "\"v=spf1 include:_mailcust.gandi.net ?all\"",
      ]
    }
    _imap__tcp_srv = {
      name = "_imap._tcp"
      type = "SRV"
      ttl  = 10800
      values = [
        "0 0 0   .",
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
        "0 0 0   .",
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
      ttl  = 10800
      values = [
        "gm1.gandimail.net.",
      ]
    }
    gm2__domainkey_cname = {
      name = "gm2._domainkey"
      type = "CNAME"
      ttl  = 10800
      values = [
        "gm2.gandimail.net.",
      ]
    }
    gm3__domainkey_cname = {
      name = "gm3._domainkey"
      type = "CNAME"
      ttl  = 10800
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
    www_a = {
      name = "www"
      type = "A"
      ttl  = 1800
      values = [
        "151.101.1.195",
        "151.101.65.195",
      ]
    }
  }
}

resource "gandi_livedns_record" "kinedirkeeckhout_be" {
  provider = gandi.m1dnight
  for_each = local.kinedirkeeckhout_be_records

  zone = "kinedirkeeckhout.be"

  name   = each.value.name
  ttl    = each.value.ttl
  type   = each.value.type
  values = each.value.values
}
