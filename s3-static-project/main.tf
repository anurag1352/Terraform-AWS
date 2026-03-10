terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.35.1"
    }
  }
}

provider "aws" {
  region = var.region
}

resource "random_id" "rand_id" {
  byte_length = 6
}

resource "aws_s3_bucket" "static-webapp" {
  bucket = "static-webapp-${random_id.rand_id.hex}"
}

resource "aws_s3_bucket_public_access_block" "example" {
  bucket = aws_s3_bucket.static-webapp.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_policy" "static-webapp" {
  bucket = aws_s3_bucket.static-webapp.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Sid       = "PublicReadGetObject",
        Effect    = "Allow",
        Principal = "*",
        Action    = "s3:GetObject",
        Resource  = "${aws_s3_bucket.static-webapp.arn}/*"
      }
    ]
  })
}

resource "aws_s3_bucket_website_configuration" "static-webapp" {
  bucket = aws_s3_bucket.static-webapp.id

  index_document {
    suffix = "index.html"
  }
}

resource "aws_s3_bucket_object" "index_html" {
  bucket       = aws_s3_bucket.static-webapp.id
  source       = "./index.html"
  key          = "index.html"
  content_type = "text/html"
}

resource "aws_s3_bucket_object" "style_css" {
  bucket       = aws_s3_bucket.static-webapp.id
  source       = "./style.css"
  key          = "style.css"
  content_type = "text/css"
}

output "name" {
  value = aws_s3_bucket_website_configuration.static-webapp.website_endpoint
}
