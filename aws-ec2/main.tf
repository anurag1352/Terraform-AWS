terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.35.0"
    }
  }
}

provider "aws" {
  region = var.region
}

resource "aws_instance" "myServer" {
  ami = "ami-06e3c045d79fd65d9"
  instance_type = "t3.micro"
}
