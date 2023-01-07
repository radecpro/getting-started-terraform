variable "instance_name" {
  type        = string
  description = "Name for the Google Compute instance"
  default     = "vm-1"
}
variable "instance_zone" {
  type        = string
  description = "Zone for the Google Compute instance"
  default     = "europe-central2-a"
}
variable "instance_type" {
  type        = string
  description = "Machine type of the Google Compute instance"
  default     = "f1-micro"
}