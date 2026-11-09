resource "google_cloud_run_v2_service" "this" {
  name     = var.name
  location = var.location
  template {
    containers {
      image = var.image
    }
  }
}
