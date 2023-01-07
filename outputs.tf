output "instance_status" {
  value       = google_compute_instance.vm-instance-1.current_status
  description = "The current status of the instance"
}
output "instance_link" {
  value       = google_compute_instance.vm-instance-1.self_link
  description = "The URI of the created resource"
}
output "external_ip" {
  value       = google_compute_address.vm_static_ip.address
  description = "External IP address to reach"
}