# Terraform-AWS

## Overview

This repository contains Terraform configurations for deploying AWS resources across several example projects. It is organized as separate folders for EC2, S3, static website hosting, and backend configuration.

## Structure

- `aws-ec2/` - Terraform code to provision EC2 instances.
- `aws-s3/` - Terraform code to create S3 buckets and related resources.
- `s3-static-project/` - Terraform code to deploy a static website to S3.
- `tf-backend/` - Terraform backend configuration for storing state remotely.

## Usage

1. Install Terraform.
2. Change into the desired folder, for example:
   ```bash
   cd aws-ec2
   ```
3. Initialize Terraform:
   ```bash
   terraform init
   ```
4. Review the plan:
   ```bash
   terraform plan
   ```
5. Apply the configuration:
   ```bash
   terraform apply
   ```

## Notes

- Review each module's `variables.tf` and `main.tf` for required settings.
- Ensure your AWS credentials are configured before running Terraform.
- Use `terraform destroy` to remove resources when no longer needed.
