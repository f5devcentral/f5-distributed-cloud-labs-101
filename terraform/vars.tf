variable "aws_region" {
  description = "aws region (default is us-east-1)"
  default     = "us-east-1"
}
variable "az1" {
  description = "zone letter"
  default     = "d"
}
variable "az2" {
  description = "zone letter"
  default     = "a"
}
variable "prefix" {
  description = "unique prefix for tags"
}
variable "ssh_key" {
  description = "name of existing ssh key"
}
variable "trusted_ip" {
  description = "IP address of trusted source for mgmt/testing"
}

