provider "aws" {
  region = var.aws_region
}


data "aws_instance" "volterra_gateway" {

  filter {
    name   = "tag-key"
    values = ["ves.io/site_name"]
  }

  filter {
    name   = "vpc-id"
    values = [var.vpc_id]
  }

}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "f5-frontend-1" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  subnet_id     = var.subnet_id
  #  private_ip             = "10.0.3.4"
  vpc_security_group_ids = [var.security_group]
  key_name               = var.ssh_key
  user_data              = <<-EOF
#!/bin/bash
sleep 30
snap install docker
systemctl enable snap.docker.dockerd
systemctl start snap.docker.dockerd
sleep 30
docker run -d --dns ${var.volterra_gateway} --net=host --restart=always \
-e F5DEMO_APP=text \
-e F5DEMO_NODENAME='AWS Environment' \
-e F5DEMO_COLOR=ffd734 \
-e F5DEMO_NODENAME_SSL='AWS Environment (Backend App)' \
-e F5DEMO_COLOR_SSL=a0bf37 \
-e F5DEMO_BACKEND_URL="https://backend.example.local:8443/txt" \
-e F5DEMO_BRAND=volterra \
-e F5DEMO_PONG_URL=http://backend.example.local:8080/pong/extended \
public.ecr.aws/y9n2y5q5/f5-demo-httpd:openshift
EOF

  tags = {
    Name = "${var.prefix}-f5-frontend-1"
  }
}

