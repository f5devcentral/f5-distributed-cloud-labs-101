data "aws_network_interface" "site-local-inside" {
  filter {
  name = "vpc-id"
  values = [var.vpc_id]
  }
  filter {
  name = "tag:ves.io/interface-type"
  values = ["site-local-inside"]
  }
}
