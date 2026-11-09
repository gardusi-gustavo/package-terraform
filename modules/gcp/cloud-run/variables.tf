variable "name" {
  type        = string
  description = "Cloud Run service name."
}

variable "location" {
  type        = string
  default     = "us-central1"
  description = "Cloud Run region."
}

variable "image" {
  type        = string
  description = "Container image reference."
}
