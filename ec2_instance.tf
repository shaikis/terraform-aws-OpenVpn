data "aws_ami" "aws_ami_id" {
  most_recent = true

  filter {
    name   = "name"
    values = [var.image_type_name] #"amzn2-ami-hvm*"
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "block-device-mapping.volume-type"
    values = [var.ebs_vol_type]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["amazon"]
}



resource "aws_instance" "openvpn" {
  ami                         = data.aws_ami.aws_ami_id.id//us-west-2
  instance_type               = var.ec2_instance_type
  vpc_security_group_ids      = aws_security_group.openvpn.id
  associate_public_ip_address = true
  subnet_id                   = var.pub_subnet_id
  iam_instance_profile        = aws_iam_instance_profile.ssm_profile.name
  user_data                   = "${data.template_file.vpn.rendered}"
  
  tags = {
    Name        = "${var.env_prefix_name}-openvpn"
    provisioner = "terraform"
  }
}

data "template_file" "vpn" {
  template = "${file("bootstrap.sh")}"

  vars = {
    region_name              = var.region
  }
}
