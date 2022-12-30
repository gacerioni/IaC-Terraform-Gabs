resource "google_storage_bucket" "default-gabs-gcs" {
  name = var.bucket_name
  storage_class = var.storage_class
  location = var.bucket_location
}
