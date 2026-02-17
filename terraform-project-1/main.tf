data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "test_vm" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type

  vpc_security_group_ids = [module.vpc.default_security_group_id]
  subnet_id = module.vpc.private_subnets[0]

  tags = {
    Name = var.instance_name
  }
}

module "vpc" {
    source = "terraform-aws-modules/vpc/aws"
    version = "5.19.0"

    name = "terraform-vpc"
    cidr = "10.0.0.0/24"

    azs = ["us-east-2"]
    private_subnets = ["10.0.1.0/25", "10.0.0.128/25"]
    public_subnets = ["10.0.0.0/24"]

    enable_dns_hostnames = true

}