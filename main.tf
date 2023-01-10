terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.44.1"
    }
  }
}

module "gce-micro-instance" {
  source              = "./modules/gce-micro-instance"
  instance_name       = "default-name"
  instance_zone       = "europe-central2-a"
  instance_network    = google_compute_network.my-local-network.self_link
  instance_subnetwork = google_compute_subnetwork.local-eu-subnet.self_link
}