locals {
  loomy_be_records = {
    _cloud_a = {
      name = "*.cloud"
      type = "A"
      ttl  = 300
      values = [
        "49.13.33.141",
      ]
    }
    apex_a = {
      name = "@"
      type = "A"
      ttl  = 300
      values = [
        "23.227.38.65",
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
        "\"google-site-verification=0NT_QwRU-g18PBTV7vU1YdFaIlVNiPyZCMZ1E72DuEI\"",
        "\"google-site-verification=YgjC9YmKhTsEWh_fvlO8P2MsMTJr6bj9IyhmBZWkctw\"",
        "\"google-site-verification=gCRXaPRKwM8Y-ip1RrdwKX8huCBHcVRVzwbZfE4D3BI\"",
        "\"v=spf1 include:_mailcust.gandi.net include:_spf.google.com ?all\"",
      ]
    }
    _1c4480587f0c0784efee5ce415fe355d_mijn_cname = {
      name = "_1c4480587f0c0784efee5ce415fe355d.mijn"
      type = "CNAME"
      ttl  = 10800
      values = [
        "_7281a67212b9b8267dee94615a0b0a1a.fmfdpfvvyn.acm-validations.aws.",
      ]
    }
    _dmarc_txt = {
      name = "_dmarc"
      type = "TXT"
      ttl  = 10800
      values = [
        "\"v=DMARC1; p=none;\"",
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
    api_development_cname = {
      name = "api.development"
      type = "CNAME"
      ttl  = 10800
      values = [
        "development.loomy.be.",
      ]
    }
    api_prod_cname = {
      name = "api.prod"
      type = "CNAME"
      ttl  = 10800
      values = [
        "prod.loomy.be.",
      ]
    }
    api_production_cname = {
      name = "api.production"
      type = "CNAME"
      ttl  = 10800
      values = [
        "production.loomy.be.",
      ]
    }
    backend_a = {
      name = "backend"
      type = "A"
      ttl  = 300
      values = [
        "88.198.40.214",
      ]
    }
    ca_cname = {
      name = "ca"
      type = "CNAME"
      ttl  = 10800
      values = [
        "api.loomy.be.",
      ]
    }
    ca_development_cname = {
      name = "ca.development"
      type = "CNAME"
      ttl  = 10800
      values = [
        "development.loomy.be.",
      ]
    }
    ca_prod_cname = {
      name = "ca.prod"
      type = "CNAME"
      ttl  = 10800
      values = [
        "prod.loomy.be.",
      ]
    }
    ca_production_cname = {
      name = "ca.production"
      type = "CNAME"
      ttl  = 10800
      values = [
        "production.loomy.be.",
      ]
    }
    cloud_a = {
      name = "cloud"
      type = "A"
      ttl  = 300
      values = [
        "49.13.33.141",
      ]
    }
    dashboard_development_cname = {
      name = "dashboard.development"
      type = "CNAME"
      ttl  = 10800
      values = [
        "development.loomy.be.",
      ]
    }
    dashboard_prod_cname = {
      name = "dashboard.prod"
      type = "CNAME"
      ttl  = 10800
      values = [
        "prod.loomy.be.",
      ]
    }
    dashboard_production_cname = {
      name = "dashboard.production"
      type = "CNAME"
      ttl  = 10800
      values = [
        "production.loomy.be.",
      ]
    }
    development_a = {
      name = "development"
      type = "A"
      ttl  = 300
      values = [
        "49.12.39.165",
      ]
    }
    gcp_a = {
      name = "gcp"
      type = "A"
      ttl  = 10800
      values = [
        "34.76.76.180",
      ]
    }
    gm1__domainkey_cname = {
      name = "gm1._domainkey"
      type = "CNAME"
      ttl  = 1080
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
    handleiding_cname = {
      name = "handleiding"
      type = "CNAME"
      ttl  = 300
      values = [
        "production.loomy.be.",
      ]
    }
    k2__domainkey_cname = {
      name = "k2._domainkey"
      type = "CNAME"
      ttl  = 1080
      values = [
        "dkim2.mcsv.net.",
      ]
    }
    k3__domainkey_cname = {
      name = "k3._domainkey"
      type = "CNAME"
      ttl  = 1080
      values = [
        "dkim3.mcsv.net.",
      ]
    }
    mailerr6k_cname = {
      name = "mailerr6k"
      type = "CNAME"
      ttl  = 1080
      values = [
        "a117ed2d236a.p133.email.myshopify.com.",
      ]
    }
    mqtt_development_cname = {
      name = "mqtt.development"
      type = "CNAME"
      ttl  = 10800
      values = [
        "development.loomy.be.",
      ]
    }
    mqtt_prod_cname = {
      name = "mqtt.prod"
      type = "CNAME"
      ttl  = 10800
      values = [
        "prod.loomy.be.",
      ]
    }
    mqtt_production_cname = {
      name = "mqtt.production"
      type = "CNAME"
      ttl  = 10800
      values = [
        "production.loomy.be.",
      ]
    }
    notifications_cloud_cname = {
      name = "notifications.cloud"
      type = "CNAME"
      ttl  = 10800
      values = [
        "cloud.loomy.be.",
      ]
    }
    notifications_development_cname = {
      name = "notifications.development"
      type = "CNAME"
      ttl  = 10800
      values = [
        "development.loomy.be.",
      ]
    }
    plausible_cname = {
      name = "plausible"
      type = "CNAME"
      ttl  = 1080
      values = [
        "call-cc.be.",
      ]
    }
    prod_a = {
      name = "prod"
      type = "A"
      ttl  = 300
      values = [
        "49.13.33.141",
      ]
    }
    production_a = {
      name = "production"
      type = "A"
      ttl  = 300
      values = [
        "49.13.33.141",
      ]
    }
    r6k__domainkey_cname = {
      name = "r6k._domainkey"
      type = "CNAME"
      ttl  = 1080
      values = [
        "dkim1.a117ed2d236a.p133.email.myshopify.com.",
      ]
    }
    r6k2__domainkey_cname = {
      name = "r6k2._domainkey"
      type = "CNAME"
      ttl  = 1080
      values = [
        "dkim2.a117ed2d236a.p133.email.myshopify.com.",
      ]
    }
    r6k3__domainkey_cname = {
      name = "r6k3._domainkey"
      type = "CNAME"
      ttl  = 1080
      values = [
        "dkim3.a117ed2d236a.p133.email.myshopify.com.",
      ]
    }
    shopify_verification_txt = {
      name = "shopify_verification"
      type = "TXT"
      ttl  = 10800
      values = [
        "\"01JACSSNY18K17YZT6R49SWCTW\"",
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
    webshop_cname = {
      name = "webshop"
      type = "CNAME"
      ttl  = 300
      values = [
        "shops.myshopify.com.",
      ]
    }
    www_cname = {
      name = "www"
      type = "CNAME"
      ttl  = 10800
      values = [
        "shops.myshopify.com.",
      ]
    }
  }
}

resource "gandi_livedns_record" "loomy_be" {
  provider = gandi.m1dnight
  for_each = local.loomy_be_records

  zone = "loomy.be"

  name   = each.value.name
  ttl    = each.value.ttl
  type   = each.value.type
  values = each.value.values
}
