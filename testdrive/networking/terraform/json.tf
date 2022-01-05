data "template_file" "json" {
  template = file("aws-site-student-awsnet.json.template")
  vars = {
  vpc_id = aws_vpc.f5-volterra-vpc.id
  outside_subnet = aws_subnet.f5-volterra-management-1.id
  inside_subnet = aws_subnet.f5-volterra-internal-3.id
  workload_subnet = aws_subnet.f5-volterra-internal-1.id
  }
}
resource "local_file" "json" {
  content = data.template_file.json.rendered
  filename = "aws-site-student-awsnet-output.json"
  
}