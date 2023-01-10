resource "google_compute_instance" "vm-instance" {
  name         = var.instance_name
  zone         = var.instance_zone
  machine_type = var.instance_type
  tags         = ["web"]
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }
  network_interface {
    network    = var.instance_network
    subnetwork = var.instance_subnetwork
    access_config {
      # Ephermal IP
    }
  }
  metadata_startup_script = "sudo apt update && sudo apt -y install apache2"
}