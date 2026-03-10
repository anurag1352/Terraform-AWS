terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.35.1"
    }
  }
  backend "s3" {
    bucket = "mybucket-70d00471f1fdb5ca"
    key = "backend.tfstate"
    region = "us-east-2"
  }
}

provider "aws" {
  region = "us-east-2"
}

resource "aws_instance" "myserver" {
  ami = "ami-06e3c045d79fd65d9"
  instance_type = "t3.micro"

  tags = {
    Name = "SampleServer"
  }
}

output "aws_instance_public_ip" {
  value = aws_instance.myserver.public_ip
}
