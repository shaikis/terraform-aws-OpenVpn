# terraform-aws-OpenVpn
OpenVpn configuration to connect from your network. (to allow the customers to connect outside your datacenter network)

```
module "" {
    source = "git@github.com:shaikis/terraform-aws-OpenVpn.git"
    vpc_id                       = module.vpc.vpc_id
    image_type_name              =  "amzn2-ami-hvm*"
    ebs_vol_type                 =  gp2
    ec2_instance_type            = "t2.nano"
    pub_subnet_id                = ""
    env_prefix_name              = "dev"
    region                       = "eu-west-1"

}