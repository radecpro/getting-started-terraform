output "instance_status" {
  value       = google_compute_instance.vm-instance.current_status
  description = "The current status of the instance"
}
output "instance_link" {
  value       = google_compute_instance.vm-instance.self_link
  description = "The URI of the created resource"
}
output "external_ip" {
  value       = google_compute_instance.vm-instance.network_interface[0].access_config[0].nat_ip
  description = "External IP address to reach"
}