data "template_file" "workload_tfvars" {
  template = "${file("../workload/terraform.tfvars.example")}"
  vars = {
  prefix = var.prefix
  region = var.aws_region
  subnet_id = aws_subnet.f5-volterra-internal-1.id
  ssh_key = var.ssh_key
  security_group = aws_security_group.volterra-vpc.id
  vpc_id = aws_vpc.f5-volterra-vpc.id
  }
}
resource "local_file" "workload_tfvars" {
  content  = "${data.template_file.workload_tfvars.rendered}"
  filename = "../workload/terraform.tfvars"
}