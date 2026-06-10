# All managed domains and their DNS records.
#
# Each domain defines its public IP and a map of records per type; types a
# domain doesn't use can be omitted entirely:
#   ip    = the IP that A records point to by default
#   a     = { name => { ttl } }          # add `values` to override the IP
#   mx    = { name => { ttl, values } }  # each value includes the priority
#   txt   = { name => { ttl, values } }  # values wrapped in escaped quotes,
#                                        # as the Gandi API stores them
#   srv   = { name => { ttl, values } }  # "priority weight port target"
#   cname = { name => { ttl, value } }   # single target, with trailing dot

locals {
  domains = {
    "call-cc.be" = {
      ip = "141.134.26.23"

      a = {
        "@" = { ttl = 1080 }

        # Catch-all for every service hostname, public (image.call-cc.be)
        # and internal (grafana.internal.call-cc.be) alike — the wildcard
        # matches multiple labels. The public/internal split is enforced by
        # the reverse proxy: hosts under .internal get LAN-only IP rules.
        "*" = { ttl = 1080 }
      }

      # Google Workspace
      mx = {
        "@" = { ttl = 10800, values = [
          "1 aspmx.l.google.com.",
          "5 alt1.aspmx.l.google.com.",
          "5 alt2.aspmx.l.google.com.",
          "10 alt3.aspmx.l.google.com.",
          "10 alt4.aspmx.l.google.com.",
        ] }
      }

      txt = {
        "@" = { ttl = 3600, values = [
          "\"google-site-verification=CQN0Y8J_4L4RCZVRljmRglZQnznJzqduFx2AI7DUMjM\"",
          "\"google-site-verification=aEfSRr4XWhCLkT6wmcHj8w1s_6F59Ddk4dwJ34-9rMs\"",
          "\"v=spf1 include:_spf.google.com ~all\"",
        ] }

        # Postmark DKIM
        "20240123170015pm._domainkey" = { ttl = 10800, values = ["\"k=rsa;p=MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCSSjyeM3GHhG+qt3F5+SDisclx/KR1ZC4Lk/pt0Rf+QFXKYRNScMG/1/c+/ghEDEsfLqj3dgerxlC8U6USScJSyOMxuMRyXEgbZQzZGq\" \"2AsoSqJWtig8JKXL/IeTm2EjW++vKsW2MAr+abTiU7CuaazGb8RPvcc9SfeghHQmNBFQIDAQAB\""] }

        # Bluesky handle verification
        "_atproto" = { ttl = 10800, values = ["\"did=did:plc:obsvrzrrxst63dvc4zu2zaik\""] }
      }

      cname = {
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

    "christophedetroyer.be" = {
      # Firebase Hosting
      ip = "141.134.26.23"

      a = {
        "@" = { ttl = 1080 }

        # Catch-all for every service hostname, public (image.call-cc.be)
        # and internal (grafana.internal.call-cc.be) alike — the wildcard
        # matches multiple labels. The public/internal split is enforced by
        # the reverse proxy: hosts under .internal get LAN-only IP rules.
        "*" = { ttl = 1080 }
      }

      # Gandi mail
      mx = {
        "@" = { ttl = 10800, values = [
          "10 spool.mail.gandi.net.",
          "50 fb.mail.gandi.net.",
        ] }
      }

      txt = {
        "@" = { ttl = 10800, values = ["\"v=spf1 include:_mailcust.gandi.net ?all\""] }

        # The live zone also holds an _acme-challenge TXT record: a transient
        # Let's Encrypt DNS-01 token written by the ACME client. Deliberately
        # unmanaged so terraform doesn't fight it.
      }

      # Gandi mail service discovery (RFC 6186)
      srv = {
        "_imap._tcp"       = { ttl = 10800, values = ["0 0 0 ."] }
        "_imaps._tcp"      = { ttl = 10800, values = ["0 1 993 mail.gandi.net."] }
        "_pop3._tcp"       = { ttl = 10800, values = ["0 0 0 ."] }
        "_pop3s._tcp"      = { ttl = 10800, values = ["10 1 995 mail.gandi.net."] }
        "_submission._tcp" = { ttl = 10800, values = ["0 1 465 mail.gandi.net."] }
      }

      cname = {
        # Gandi mail
        "gm1._domainkey" = { ttl = 1200, value = "gm1.gandimail.net." }
        "gm2._domainkey" = { ttl = 1200, value = "gm2.gandimail.net." }
        "gm3._domainkey" = { ttl = 1200, value = "gm3.gandimail.net." }
        "webmail"        = { ttl = 10800, value = "webmail.gandi.net." }
      }
    }

    "genserver.be" = {
      # Gandi web forwarding (webredir), not the homelab IP
      ip = "141.134.26.23"

      a = {
        "@" = { ttl = 10800 }

        # Catch-all for every service hostname, public (image.call-cc.be)
        # and internal (grafana.internal.call-cc.be) alike — the wildcard
        # matches multiple labels. The public/internal split is enforced by
        # the reverse proxy: hosts under .internal get LAN-only IP rules.
        "*" = { ttl = 1080 }
      }

      # Gandi mail
      mx = {
        "@" = { ttl = 10800, values = [
          "10 spool.mail.gandi.net.",
          "50 fb.mail.gandi.net.",
        ] }
      }

      txt = {
        "@" = { ttl = 10800, values = ["\"v=spf1 include:_mailcust.gandi.net ?all\""] }

        # Bluesky handle verification
        "_atproto" = { ttl = 10800, values = ["\"did=did:plc:obsvrzrrxst63dvc4zu2zaik\""] }

        # The live zone also holds _acme-challenge / _acme-challenge.ferri
        # TXT records: transient Let's Encrypt DNS-01 tokens written by the
        # ACME client. Deliberately unmanaged so terraform doesn't fight it.
      }

      # Gandi mail service discovery (RFC 6186)
      srv = {
        "_imap._tcp"       = { ttl = 10800, values = ["0 0 0 ."] }
        "_imaps._tcp"      = { ttl = 10800, values = ["0 1 993 mail.gandi.net."] }
        "_pop3._tcp"       = { ttl = 10800, values = ["0 0 0 ."] }
        "_pop3s._tcp"      = { ttl = 10800, values = ["10 1 995 mail.gandi.net."] }
        "_submission._tcp" = { ttl = 10800, values = ["0 1 465 mail.gandi.net."] }
      }

      cname = {
        # Gandi mail
        "gm1._domainkey" = { ttl = 10800, value = "gm1.gandimail.net." }
        "gm2._domainkey" = { ttl = 10800, value = "gm2.gandimail.net." }
        "gm3._domainkey" = { ttl = 10800, value = "gm3.gandimail.net." }
        "webmail"        = { ttl = 10800, value = "webmail.gandi.net." }

        # Gandi web forwarding
        "www" = { ttl = 10800, value = "webredir.vip.gandi.net." }
      }
    }
  }
}
