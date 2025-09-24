provider "AWS" {
  Region = "us-east-1"

}


resource "aws_instance" "EC2Instance" {
  ami           = "ami-08982f1c5bf93d976"
  instance_type = "t3.micro"
  vpc_security_group_ids = [aws_security_group.SG-CLI.id]

  tags = {
    Name = "EC2CLI"
    Provisionado = "Terraform" 
  }
}

## Security Group 

resource "aws_security_group" "SG-CLI" {
  name        = "SG-EC2-CLI"
  description = "Cricao de security aws_security_group"
  vpc_id      = "vpc-003e23d66dea1e353"

  tags = {
    Name = "VPS-CLI"
    Provisionado = "Terraform"
  }
}


resource "aws_vpc_security_group_ingress_rule" "alow-SSh-CLI" {
  security_group_id = aws_security_group.SG-CLI.id
  cidr_ipv4         = "179.54.217.183/32"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

resource "aws_vpc_security_group_ingress_rule" "alow-http-CLI" {
  security_group_id = aws_security_group.SG-CLI.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}

resource "aws_vpc_security_group_ingress_rule" "alow-https-CLI" {
  security_group_id = aws_security_group.SG-CLI.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 443
  ip_protocol       = "tcp"
  to_port           = 443
}


resource "aws_vpc_security_group_egress_rule" "InternetCLI" {
  security_group_id = aws_security_group.SG-CLI.id

  cidr_ipv4   = "0.0.0.0/0"
  ip_protocol = -1

}