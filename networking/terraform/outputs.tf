output "_VPC_ID" {
  value = aws_vpc.f5-volterra-vpc.id
}
output "EXTERNAL_SUBNET_ID" {
  value = aws_subnet.f5-volterra-management-1.id
}

output "WORKLOAD_SUBNET_ID" {
  value = aws_subnet.f5-volterra-internal-1.id
}

output "INTERNAL_SUBNET_ID" {
  value = aws_subnet.f5-volterra-internal-3.id
}

output "AWS_INSTANCE" {
  value = aws_instance.f5-jumphost-1.public_ip
}

data "aws_caller_identity" "current" {}

output "AWS_CONSOLE" {
  value = "https://${data.aws_caller_identity.current.account_id}.signin.aws.amazon.com/console?region=${var.aws_region}"
}

output "AWS_BUCKET_URL" {
  value = aws_s3_bucket.tf_s3_bucket.bucket_domain_name
}
output "AWS_ENDPOINT_URL" {
  value = aws_vpc_endpoint.interface-s3.dns_entry[0].dns_name
}