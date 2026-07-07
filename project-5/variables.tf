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
