variable "prefix" {
  description = "unique prefix"
}

variable "region" {
  description = "The location/region where the virtual networks are created. Changing this forces a new resource to be created."
}

variable "project" {
  description = "Google Project ID"
}

variable "trusted_ip" {
  description = "IP address of trusted source for mgmt/testing"
  default = "192.0.2.10/32"
}