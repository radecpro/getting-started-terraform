resource "google_compute_network" "my-local-network" {
  name                    = "my-local-network"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "local-eu-subnet" {
  name          = "local-eu-subnet"
  ip_cidr_range = "10.10.0.0/20"
  network       = google_compute_network.my-local-network.id
}

resource "google_compute_firewall" "local-allow-ssh-rdp-iap" {
  name    = "local-allow-ssh-rdp-iap"
  network = google_compute_network.my-local-network.self_link

  allow {
    protocol = "tcp"
    ports    = ["22", "3389"]
  }

  source_ranges = ["35.235.240.0/20"]
}

resource "google_compute_firewall" "local-allow-http" {
  name    = "local-allow-http"
  network = google_compute_network.my-local-network.self_link

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  source_ranges = ["0.0.0.0/0"]

  target_tags = ["web"]
}

resource "google_compute_firewall" "local-allow-ping" {
  name    = "local-allow-ping"
  network = google_compute_network.my-local-network.self_link

  allow {
    protocol = "icmp"
  }

  source_ranges = ["0.0.0.0/0"]
}