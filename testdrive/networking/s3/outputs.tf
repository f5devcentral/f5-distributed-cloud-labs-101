
output "AWS_BUCKET_URL" {
  value = aws_s3_bucket.tf_s3_bucket.bucket_domain_name
}
output "AWS_ENDPOINT_URL" {
  value = aws_vpc_endpoint.interface-s3.dns_entry[0].dns_name
}