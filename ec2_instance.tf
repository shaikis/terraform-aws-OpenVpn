data "aws_ami" "amazon_linux_2" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "block-device-mapping.volume-type"
    values = ["gp2"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["amazon"]
}



resource "aws_instance" "openvpn" {
  ami                         = "ami-0d2f82a622136a696" //us-west-2
  instance_type               = "t2.micro"
  vpc_security_group_ids      = aws_security_group.vpn.id
  associate_public_ip_address = true
  subnet_id                   = "${aws_subnet.PubSubnet2a.id}"
  iam_instance_profile        = "${aws_iam_instance_profile.aws-vpn-profile.name}"
  user_data                   = "${data.template_file.vpn.rendered}"
  tags = {
    Name = "${var.env_prefix_name}-vpn"
  }
}

data "template_file" "vpn" {
  template = "${file("bootstrap.sh")}"

  vars = {
    region_name              = var.region
  }
}
