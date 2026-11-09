variable "zone_id" {
  type        = string
  description = "Cloudflare zone identifier."
}

variable "records" {
  type = list(object({
    name    = string
    type    = string
    content = string
    proxied = optional(bool, true)
  }))
  default     = []
  description = "DNS records."
}
