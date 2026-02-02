locals {
  kimber_be_records = {
    apex_a = {
      name = "@"
      type = "A"
      ttl  = 10800
      values = [
        "141.134.25.8",
      ]
    }
    apex_mx = {
      name = "@"
      type = "MX"
      ttl  = 10800
      values = [
        "1 aspmx.l.google.com.",
        "10 alt3.aspmx.l.google.com.",
        "10 alt4.aspmx.l.google.com.",
        "5 alt1.aspmx.l.google.com.",
        "5 alt2.aspmx.l.google.com.",
      ]
    }
    apex_txt = {
      name = "@"
      type = "TXT"
      ttl  = 10800
      values = [
        "\"google-site-verification=ROSKfigVuvrjg98uw27omhCCIKZ672vqU1LtL24RTHU\"",
        "\"google-site-verification=ROSKfigVuvrjg98uw27omhCCIKZ672vqU1LtL24RTHU\"",
        "\"google-site-verification=ROSKfigVuvrjg98uw27omhCCIKZ672vqU1LtL24RTHU\"",
        "\"google-site-verification=ROSKfigVuvrjg98uw27omhCCIKZ672vqU1LtL24RTHU\"",
        "\"google-site-verification=ROSKfigVuvrjg98uw27omhCCIKZ672vqU1LtL24RTHU\"",
        "\"v=spf1 include:_mailcust.gandi.net include:_spf.google.com include:_spf.google.com include:_spf.google.com include:_spf.google.com include:_spf.google.com ?all\"",
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

resource "gandi_livedns_record" "kimber_be" {
  provider = gandi.callcc
  for_each = local.kimber_be_records

  zone = "kimber.be"

  name   = each.value.name
  ttl    = each.value.ttl
  type   = each.value.type
  values = each.value.values
}
