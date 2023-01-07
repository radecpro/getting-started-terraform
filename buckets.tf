resource "google_storage_bucket" "banded-arcana-369922-bucket" {
  name          = "banded-arcana-369922-bucket"
  force_destroy = true
  location      = "EU"
  storage_class = "STANDARD"
  versioning {
    enabled = true
  }
}