output _VPC_ID {
  value = aws_vpc.f5-volterra-vpc.id
}
output EXTERNAL_SUBNET_ID {
  value = aws_subnet.f5-volterra-management-1.id
}

output INTERNAL_SUBNET_ID {
  value = aws_subnet.f5-volterra-internal-1.id
}

output INTERNAL2_SUBNET_ID {
  value = aws_subnet.f5-volterra-internal-3.id
}

output AWS_INSTANCE {
  value = aws_instance.f5-jumphost-1.public_ip
}