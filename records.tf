# Flattens local.domains into one gandi_livedns_record per (zone, name, type),
# keyed "zone/name/type" — the same format as the provider's import IDs.

locals {
  records = merge(flatten([
    for zone, domain in local.domains : [
      { for name, r in try(domain.a, {}) :
        "${zone}/${name}/A" => { zone = zone, name = name, type = "A", ttl = r.ttl, values = try(r.values, [domain.ip]) }
      },
      { for name, r in try(domain.mx, {}) :
        "${zone}/${name}/MX" => { zone = zone, name = name, type = "MX", ttl = r.ttl, values = r.values }
      },
      { for name, r in try(domain.txt, {}) :
        "${zone}/${name}/TXT" => { zone = zone, name = name, type = "TXT", ttl = r.ttl, values = r.values }
      },
      { for name, r in try(domain.srv, {}) :
        "${zone}/${name}/SRV" => { zone = zone, name = name, type = "SRV", ttl = r.ttl, values = r.values }
      },
      { for name, r in try(domain.cname, {}) :
        "${zone}/${name}/CNAME" => { zone = zone, name = name, type = "CNAME", ttl = r.ttl, values = [r.value] }
      },
    ]
  ])...)
}

resource "gandi_livedns_record" "records" {
  for_each = local.records

  zone   = each.value.zone
  name   = each.value.name
  type   = each.value.type
  ttl    = each.value.ttl
  values = each.value.values
}
