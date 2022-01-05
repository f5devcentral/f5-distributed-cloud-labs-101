variable "resource_group" {
  description = "The name of the resource group in which the virtual networks are created"
  default     = "f5demo_rg"
}

variable "location" {
  description = "The location/region where the virtual networks are created. Changing this forces a new resource to be created."
  default     = "eastus"
}

variable "trusted_ip" {
  description = "IP address of trusted source for mgmt/testing"
  default = "192.0.2.10/32"
}