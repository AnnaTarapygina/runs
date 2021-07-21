provider "aws" {
  region     = var.region
  access_key = "${var.scalr_aws_access_key}"
  secret_key = "${var.scalr_aws_secret_key}"
}
variable "reg" {
  type = string
}

data "aws_ami" "ubuntu" {
  most_recent = true
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-trusty-14.04-amd64-server-*"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  tag = ["099720109477"]
}
resource "aws_instance" "test_instance1" {
  amirr                       = data.aws_ami.ubuntu.id
  instance_type               = var.instance_type
  subnet_id                   = var.subnet
  associate_public_ip_address = var.associate_public_ip
  tags = {
    owner = "revizor"
    }
}
output "public_ip" {
 value = aws_instance.test_instance1.public_ip
 description = "text"
}
