variable "aws_region" {
    type = string
    description = "Region to use for AWS instance"
    default = "us-east-1"
    sensitive = false
}

variable "instance_tag_name" {
    type = string
    description = "Region to use for AWS instance"
    default = "no-name"
    sensitive = false
}

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
  region = var.aws_region
}

resource "aws_instance" "vm-web" {
  ami           = "ami-0889a44b331db0194"
  instance_type = "t2.micro"

  tags = {
    Name = var.instance_tag_name
    Env = "dev"
  }
}