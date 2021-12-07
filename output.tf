output "ec2_instance_public_ip" {
    value = aws_instance.openvpn.public_ip
}

output "ec2_instance_id" {
    value = aws_instance.openvpn.id
}

output "ec2_instance_private_ip" {
    value = aws_instance.openvpn.private_ip
}

output "ec2_instance_ipv6_address" {
    value = aws_instance.openvpn.ipv6_addresses
}