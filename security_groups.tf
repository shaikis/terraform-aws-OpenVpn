resource "aws_security_group" "openvpn" {
  name        = var.sg_name
  description = "Allow inbound UDP access to OpenVPN and unrestricted egress"

  vpc_id = var.vpc_id

  tags = {
    Name        = "${var.sg_name}_sg"
    Provisioner = "Terraform"
  }

  ingress {
    from_port   = 1194
    to_port     = 1194
    protocol    = "udp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
}
