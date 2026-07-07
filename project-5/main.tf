resource "aws_s3_bucket" "terraform-bucket" {
  bucket = local.bucket_name

  tags = {
    Name        = "${local.bucket_name}"
    Environment = var.Environment
  }
}

resource "aws_vpc" "sample" {
    cidr_block = "10.0.1.0/24"
    region = var.region

    tags = {
        Name = "${var.Environment}-VPC"
        Environment = var.Environment
    }
}

resource "aws_instance" "sample-instance" {
  ami = var.ec2_ami
  instance_type = var.ec2_instance_type
  region = var.region

  tags = {
    Environment = var.Environment
    Name = "Sample-Instance"
  }
}