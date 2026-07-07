variable "Environment" {
    default = "dev"
    type = string
}

variable "bucket_name" {
  default = "jalen-jones-test-terraform"
  type = string
}

variable "region" {
  default = "us-east-2"
  type = string 
}

variable "ec2_ami" {
  default = "ami-0772d6acfbccb1275"
  type = string
}

variable "ec2_instance_type" {
  default = "t2.micro"
  type = string
}

locals {
  vpc_name = "${var.Environment}-VPC"
  bucket_name = "${var.bucket_name}-bucket-${var.Environment}-${var.region}"
}

output "vpc_id" {
  value = aws_vpc.sample.id
}

output "ec2_id" {
  value = aws_instance.sample-instance.id
}