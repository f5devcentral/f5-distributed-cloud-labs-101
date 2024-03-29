provider "aws" {
  region = var.aws_region
}

resource "aws_s3_bucket" "tf_s3_bucket" {
  bucket_prefix = "${var.prefix}-s3bucket"
}

resource "aws_s3_bucket_object" "object" {
  bucket         = aws_s3_bucket.tf_s3_bucket.id
  key            = "top-secret-file.txt"
  content_base64 = "dGhpcy1pcy1hLXNlY3JldAo="
  acl            = "public-read"
}

# resource "aws_vpc_endpoint" "s3" {
#   vpc_id          = var.vpc_id
#   service_name    = "com.amazonaws.${var.aws_region}.s3"
#   route_table_ids = [var.route_id]
# }

resource "aws_vpc_endpoint" "interface-s3" {
  vpc_id             = var.vpc_id
  service_name       = "com.amazonaws.${var.aws_region}.s3"
  vpc_endpoint_type  = "Interface"
  subnet_ids         = [var.subnet_id]
  security_group_ids = [var.security_group]
}


resource "aws_s3_bucket_policy" "restrict" {
  bucket = aws_s3_bucket.tf_s3_bucket.id

  # Terraform's "jsonencode" function converts a
  # Terraform expression's result to valid JSON syntax.
  policy = jsonencode({
    Version = "2012-10-17"
    Id      = "RestrictIPVpc"
    Statement = [
      {
        Sid       = "IPAllow"
        Effect    = "Deny"
        Principal = "*"
        Action    = "s3:*"
        Resource = [
          aws_s3_bucket.tf_s3_bucket.arn,
          "${aws_s3_bucket.tf_s3_bucket.arn}/*",
        ]
        Condition = {
          NotIpAddress = {
            "aws:SourceIp" = [
              var.trusted_ip
            ]
          },
          StringNotEquals = {
            "aws:SourceVpce" = [
              aws_vpc_endpoint.interface-s3.id
            ]
          }
        }
      }
    ]
  })
}