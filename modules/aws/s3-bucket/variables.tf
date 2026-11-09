variable "name" {
  type        = string
  description = "Bucket name prefix."
  validation {
    condition     = can(regex("^[a-z0-9][a-z0-9-]{1,61}[a-z0-9]$", var.name))
    error_message = "name must be a valid S3 bucket name."
  }
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Resource tags."
}
