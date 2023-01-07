resource "google_compute_address" "vm_static_ip" {
  name = "terraform-static-ip"
}

resource "google_compute_instance" "vm-instance-1" {
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
    network    = google_compute_network.my-local-network.self_link
    subnetwork = google_compute_subnetwork.local-eu-subnet.self_link
    access_config {
      # Allocate a one-to-one NAT IP to the instance
      nat_ip = google_compute_address.vm_static_ip.address
    }
  }
  metadata_startup_script = "sudo apt update && sudo apt -y install apache2"
}