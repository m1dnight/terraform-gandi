# # Import blocks for records that already exist in the live zone, so apply
# # adopts them instead of trying to create duplicates. The import ID is the
# # same "zone/name/type" string as the resource key (see records.tf).
# #
# # Safe to delete once the records have been imported.

# import {
#   to = gandi_livedns_record.records["christophedetroyer.be/@/A"]
#   id = "christophedetroyer.be/@/A"
# }

# import {
#   to = gandi_livedns_record.records["christophedetroyer.be/@/MX"]
#   id = "christophedetroyer.be/@/MX"
# }

# import {
#   to = gandi_livedns_record.records["christophedetroyer.be/@/TXT"]
#   id = "christophedetroyer.be/@/TXT"
# }

# import {
#   to = gandi_livedns_record.records["christophedetroyer.be/_imap._tcp/SRV"]
#   id = "christophedetroyer.be/_imap._tcp/SRV"
# }

# import {
#   to = gandi_livedns_record.records["christophedetroyer.be/_imaps._tcp/SRV"]
#   id = "christophedetroyer.be/_imaps._tcp/SRV"
# }

# import {
#   to = gandi_livedns_record.records["christophedetroyer.be/_pop3._tcp/SRV"]
#   id = "christophedetroyer.be/_pop3._tcp/SRV"
# }

# import {
#   to = gandi_livedns_record.records["christophedetroyer.be/_pop3s._tcp/SRV"]
#   id = "christophedetroyer.be/_pop3s._tcp/SRV"
# }

# import {
#   to = gandi_livedns_record.records["christophedetroyer.be/_submission._tcp/SRV"]
#   id = "christophedetroyer.be/_submission._tcp/SRV"
# }

# import {
#   to = gandi_livedns_record.records["christophedetroyer.be/gm1._domainkey/CNAME"]
#   id = "christophedetroyer.be/gm1._domainkey/CNAME"
# }

# import {
#   to = gandi_livedns_record.records["christophedetroyer.be/gm2._domainkey/CNAME"]
#   id = "christophedetroyer.be/gm2._domainkey/CNAME"
# }

# import {
#   to = gandi_livedns_record.records["christophedetroyer.be/gm3._domainkey/CNAME"]
#   id = "christophedetroyer.be/gm3._domainkey/CNAME"
# }

# import {
#   to = gandi_livedns_record.records["christophedetroyer.be/webmail/CNAME"]
#   id = "christophedetroyer.be/webmail/CNAME"
# }
