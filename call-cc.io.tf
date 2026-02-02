locals {
  call-cc_io_records = {
    apex_a = {
      name = "@"
      type = "A"
      ttl  = 10800
      values = [
        data.external.public_ip.result.ip,
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
        "\"protonmail-verification=705307b346de2e026a3c5ffb87d90ebfc5a588fc\"",
        "\"v=spf1 include:_mailcust.gandi.net ?all\"",
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
    www_cname = {
      name = "www"
      type = "CNAME"
      ttl  = 10800
      values = [
        "webredir.vip.gandi.net.",
      ]
    }
  }
}

resource "gandi_livedns_record" "call-cc_io" {
  provider = gandi.callcc
  for_each = local.call-cc_io_records

  zone = "call-cc.io"

  name   = each.value.name
  ttl    = each.value.ttl
  type   = each.value.type
  values = each.value.values
}
