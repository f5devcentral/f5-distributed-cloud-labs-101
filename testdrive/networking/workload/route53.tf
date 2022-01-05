resource "aws_route53_zone" "private" {
  name = "f5demos.internal"

  vpc {
    vpc_id = var.vpc_id
  }
}

resource "aws_route53_record" "jumphost" {
  zone_id = aws_route53_zone.private.zone_id
  name    = "jumphost.lab.f5demos.internal"
  type    = "A"
  ttl     = "300"
  records = [aws_instance.f5-frontend-1.private_ip]
}

resource "aws_route53_record" "private" {
  zone_id = aws_route53_zone.private.zone_id
  name    = "private.lab.f5demos.internal"
  type    = "A"
  ttl     = "300"
  records = [aws_instance.f5-frontend-1.private_ip]
}


# resource "aws_route53_resolver_endpoint" "example" {
#   name      = "example"
#   direction = "OUTBOUND"

#   security_group_ids = [
#     var.security_group
#   ]

#   ip_address {
#     subnet_id = var.subnet_id
#   }

#   ip_address {
#     subnet_id = "subnet-084b9379718776c6a"
#   }

# }

# resource "aws_route53_resolver_rule" "example" {
#   name = "example"
#   domain_name = "example.internal"
#   rule_type = "FORWARD"
#   resolver_endpoint_id = aws_route53_resolver_endpoint.example.id
#   target_ip {
#     ip = var.volterra_gateway
#   }
# }
