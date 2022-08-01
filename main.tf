# Creating aws resources 
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}
provider "aws" {
  profile = "default"
  region  = "eu-west-2"
}
resource "aws_instance" "web" {
  count         = length(var.ins_name)
  ami           = var.instance_type[count.index]
  instance_type = "t2.micro"

  tags = {
    Name  = var.ins_name[count.index]
    owner = "Yusuf"
  }
}