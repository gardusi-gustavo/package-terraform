resource "cloudflare_record" "this" {
  for_each = { for record in var.records : "${record.name}-${record.type}" => record }
  zone_id  = var.zone_id
  name     = each.value.name
  type     = each.value.type
  content  = each.value.content
  proxied  = each.value.proxied
}
