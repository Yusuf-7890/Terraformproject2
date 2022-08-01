terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

# Configure the AWS Provider

provider "aws" {
  region = "eu-west-2"
}


#creating the resources on the AWS
resource "aws_instance" "Server" {
  for_each      = var.loop_name
  ami           = each.value.ami
  instance_type = each.value.instance_type

  tags = {
    Name  = each.value.name
    Owner = each.key
  }
}
resource "aws_instance" "Server2" {   
    for_each = toset(var.SET)
    ami  = "ami-08df646e18b182346"
    instance_type = "t2.micro"
    tags = {
      Name = each.key
      Owner= "Yusuf"
  }
}