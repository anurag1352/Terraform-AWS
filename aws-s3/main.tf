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

resource "random_id" "rand_id" {
  byte_length = 8
}

resource "aws_s3_bucket" "mybucket" {
  bucket = "mybucket-${random_id.rand_id.hex}"
}

resource "aws_s3_object" "mydata" {
    bucket = aws_s3_bucket.mybucket.bucket
    source = "./demo.txt"
    key = "data.txt"
}

output "name" {
  value = random_id.rand_id.hex
}
