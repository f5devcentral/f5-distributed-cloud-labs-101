output workload_ip {
  value = aws_instance.f5-backend-1.private_ip
}
output volterra_gateway {
  value = data.aws_instance.volterra_gateway.private_ip
}
