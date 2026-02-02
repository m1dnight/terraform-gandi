locals {
  call-cc_be_records = {
    _andromeda_cname = {
      name = "*.andromeda"
      type = "CNAME"
      ttl  = 10800
      values = [
        "call-cc.be.",
      ]
    }
    _coolify_cname = {
      name = "*.coolify"
      type = "CNAME"
      ttl  = 10800
      values = [
        "call-cc.be.",
      ]
    }
    _20240123170015pm__domainkey_txt = {
      name = "20240123170015pm._domainkey"
      type = "TXT"
      ttl  = 10800
      values = [
        "\"k=rsa;p=MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCSSjyeM3GHhG+qt3F5+SDisclx/KR1ZC4Lk/pt0Rf+QFXKYRNScMG/1/c+/ghEDEsfLqj3dgerxlC8U6USScJSyOMxuMRyXEgbZQzZGq\" \"2AsoSqJWtig8JKXL/IeTm2EjW++vKsW2MAr+abTiU7CuaazGb8RPvcc9SfeghHQmNBFQIDAQAB\"",
      ]
    }
    _33f034812dca424364df7d6cd606cb5f_www_cname = {
      name = "33f034812dca424364df7d6cd606cb5f.www"
      type = "CNAME"
      ttl  = 10800
      values = [
        "6103a042790a0681b92f24906e453c7b7e874e40.comodoca.com.",
      ]
    }
    _8f630182d86f50b4fd7ec8d725833f8c_www_cname = {
      name = "8f630182d86f50b4fd7ec8d725833f8c.www"
      type = "CNAME"
      ttl  = 10800
      values = [
        "64d876a2579d206a929fd5d5b951fca90b2713eb.comodoca.com.",
      ]
    }
    apex_a = {
      name = "@"
      type = "A"
      ttl  = 1080
      values = [
        data.external.public_ip.result.ip,
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
      ttl  = 3600
      values = [
        "\"google-site-verification=CQN0Y8J_4L4RCZVRljmRglZQnznJzqduFx2AI7DUMjM\"",
        "\"google-site-verification=aEfSRr4XWhCLkT6wmcHj8w1s_6F59Ddk4dwJ34-9rMs\"",
        "\"v=spf1 include:_spf.google.com ~all\"",
      ]
    }
    _atproto_txt = {
      name = "_atproto"
      type = "TXT"
      ttl  = 10800
      values = [
        "\"did=did:plc:obsvrzrrxst63dvc4zu2zaik\"",
      ]
    }
    andromeda_cname = {
      name = "andromeda"
      type = "CNAME"
      ttl  = 10800
      values = [
        "call-cc.be.",
      ]
    }
    audiobooks_cname = {
      name = "audiobooks"
      type = "CNAME"
      ttl  = 10800
      values = [
        "call-cc.be.",
      ]
    }
    bazarr_cname = {
      name = "bazarr"
      type = "CNAME"
      ttl  = 10800
      values = [
        "call-cc.be.",
      ]
    }
    butler_cname = {
      name = "butler"
      type = "CNAME"
      ttl  = 10800
      values = [
        "call-cc.be.",
      ]
    }
    chat_cname = {
      name = "chat"
      type = "CNAME"
      ttl  = 10800
      values = [
        "call-cc.be.",
      ]
    }
    coolify_cname = {
      name = "coolify"
      type = "CNAME"
      ttl  = 10800
      values = [
        "call-cc.be.",
      ]
    }
    eth_cname = {
      name = "eth"
      type = "CNAME"
      ttl  = 10800
      values = [
        "call-cc.be.",
      ]
    }
    exbin_cname = {
      name = "exbin"
      type = "CNAME"
      ttl  = 10800
      values = [
        "call-cc.be.",
      ]
    }
    garage_cname = {
      name = "garage"
      type = "CNAME"
      ttl  = 10800
      values = [
        "call-cc.be.",
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
    homeassistant_cname = {
      name = "homeassistant"
      type = "CNAME"
      ttl  = 10800
      values = [
        "call-cc.be.",
      ]
    }
    imap_cname = {
      name = "imap"
      type = "CNAME"
      ttl  = 10800
      values = [
        "access.mail.gandi.net.",
      ]
    }
    jackett_cname = {
      name = "jackett"
      type = "CNAME"
      ttl  = 10800
      values = [
        "call-cc.be.",
      ]
    }
    kvm_cname = {
      name = "kvm"
      type = "CNAME"
      ttl  = 10800
      values = [
        "call-cc.be.",
      ]
    }
    lidarr_cname = {
      name = "lidarr"
      type = "CNAME"
      ttl  = 10800
      values = [
        "call-cc.be.",
      ]
    }
    loki_cname = {
      name = "loki"
      type = "CNAME"
      ttl  = 10800
      values = [
        "call-cc.be.",
      ]
    }
    mimir_cname = {
      name = "mimir"
      type = "CNAME"
      ttl  = 10800
      values = [
        "call-cc.be.",
      ]
    }
    minio_cname = {
      name = "minio"
      type = "CNAME"
      ttl  = 10800
      values = [
        "call-cc.be.",
      ]
    }
    music_cname = {
      name = "music"
      type = "CNAME"
      ttl  = 10800
      values = [
        "call-cc.be.",
      ]
    }
    n8n_cname = {
      name = "n8n"
      type = "CNAME"
      ttl  = 10800
      values = [
        "call-cc.be.",
      ]
    }
    observability_cname = {
      name = "observability"
      type = "CNAME"
      ttl  = 10800
      values = [
        "call-cc.be.",
      ]
    }
    pbs_cname = {
      name = "pbs"
      type = "CNAME"
      ttl  = 10800
      values = [
        "call-cc.be.",
      ]
    }
    pm-bounces_cname = {
      name = "pm-bounces"
      type = "CNAME"
      ttl  = 10800
      values = [
        "pm.mtasv.net.",
      ]
    }
    pop_cname = {
      name = "pop"
      type = "CNAME"
      ttl  = 10800
      values = [
        "access.mail.gandi.net.",
      ]
    }
    proxmox_cname = {
      name = "proxmox"
      type = "CNAME"
      ttl  = 1080
      values = [
        "call-cc.be.",
      ]
    }
    pulsar_cname = {
      name = "pulsar"
      type = "CNAME"
      ttl  = 10800
      values = [
        "call-cc.be.",
      ]
    }
    radarr_cname = {
      name = "radarr"
      type = "CNAME"
      ttl  = 10800
      values = [
        "call-cc.be.",
      ]
    }
    s3_cname = {
      name = "s3"
      type = "CNAME"
      ttl  = 10800
      values = [
        "call-cc.be.",
      ]
    }
    share_cname = {
      name = "share"
      type = "CNAME"
      ttl  = 10800
      values = [
        "call-cc.be.",
      ]
    }
    smtp_cname = {
      name = "smtp"
      type = "CNAME"
      ttl  = 10800
      values = [
        "relay.mail.gandi.net.",
      ]
    }
    sonarr_cname = {
      name = "sonarr"
      type = "CNAME"
      ttl  = 10800
      values = [
        "call-cc.be.",
      ]
    }
    synology_cname = {
      name = "synology"
      type = "CNAME"
      ttl  = 10800
      values = [
        "call-cc.be.",
      ]
    }
    transmission_cname = {
      name = "transmission"
      type = "CNAME"
      ttl  = 10800
      values = [
        "call-cc.be.",
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
    x0_cname = {
      name = "x0"
      type = "CNAME"
      ttl  = 10800
      values = [
        "call-cc.be.",
      ]
    }
  }
}

resource "gandi_livedns_record" "call-cc_be" {
  provider = gandi.m1dnight
  for_each = local.call-cc_be_records

  zone = "call-cc.be"

  name   = each.value.name
  ttl    = each.value.ttl
  type   = each.value.type
  values = each.value.values
}
