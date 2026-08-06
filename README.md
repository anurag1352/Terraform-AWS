# Terraform Lab

A comprehensive hands-on Terraform lab designed to learn Infrastructure as Code (IaC) by provisioning and managing cloud infrastructure on AWS. This repository covers Terraform fundamentals, state management, modules, workspaces, remote backends, and production best practices.

---

# Objectives

- Learn Infrastructure as Code (IaC)
- Understand Terraform workflow
- Write reusable Terraform code
- Provision AWS infrastructure
- Manage Terraform State
- Create reusable Modules
- Work with Variables and Outputs
- Use Remote Backend
- Manage Multiple Environments
- Learn Terraform Best Practices

---

# Prerequisites

- AWS Account
- AWS CLI Installed
- Terraform >= 1.5
- VS Code
- Git
- Basic Linux Knowledge

---

# Verify Installation

```bash
terraform -version
aws --version
git --version
```

Configure AWS

```bash
aws configure
```

Verify Credentials

```bash
aws sts get-caller-identity
```

---

# Repository Structure

```
terraform-lab/
│
├── 01-Terraform-Basics/
├── 02-Providers/
├── 03-Variables/
├── 04-Outputs/
├── 05-Locals/
├── 06-Data-Sources/
├── 07-Resources/
├── 08-State/
├── 09-Remote-Backend/
├── 10-Modules/
├── 11-Workspaces/
├── 12-Provisioners/
├── 13-EC2/
├── 14-VPC/
├── 15-S3/
├── 16-IAM/
├── 17-Security-Groups/
├── 18-LoadBalancer/
├── 19-AutoScaling/
├── 20-RDS/
├── 21-ECR/
├── 22-ECS/
├── 23-Lambda/
├── 24-CloudWatch/
├── 25-DynamoDB/
├── 26-Route53/
├── 27-CloudFront/
├── 28-Project/
└── README.md
```

---

# Terraform Workflow

```
Write Code
     │
     ▼
terraform init
     │
     ▼
terraform validate
     │
     ▼
terraform fmt
     │
     ▼
terraform plan
     │
     ▼
terraform apply
     │
     ▼
Infrastructure Created
     │
     ▼
terraform destroy
```

---

# Lab 1 — Terraform Basics

Initialize Terraform

```bash
terraform init
```

Validate Configuration

```bash
terraform validate
```

Format Code

```bash
terraform fmt
```

Create Execution Plan

```bash
terraform plan
```

Apply Changes

```bash
terraform apply
```

Destroy Resources

```bash
terraform destroy
```

---

# Lab 2 — Providers

Topics

- AWS Provider
- Version Constraints
- Provider Configuration

Example

```hcl
provider "aws" {
  region = "ap-south-1"
}
```

---

# Lab 3 — Variables

Topics

- Input Variables
- Default Values
- Variable Types

Run

```bash
terraform apply -var="instance_type=t2.micro"
```

---

# Lab 4 — Outputs

Example

```hcl
output "instance_public_ip" {
  value = aws_instance.web.public_ip
}
```

Display Outputs

```bash
terraform output
```

---

# Lab 5 — Locals

Example

```hcl
locals {
  environment = "dev"
}
```

---

# Lab 6 — Data Sources

Example

```hcl
data "aws_ami" "amazon_linux" {
  most_recent = true
}
```

---

# Lab 7 — Resources

Create

- EC2
- S3 Bucket
- Security Group

Commands

```bash
terraform apply
terraform destroy
```

---

# Lab 8 — Terraform State

Topics

- terraform.tfstate
- State Locking
- State Backup
- State Commands

Commands

```bash
terraform state list
terraform state show
terraform state rm
terraform state mv
```

---

# Lab 9 — Remote Backend

Backend

- Amazon S3
- DynamoDB Locking

Initialize

```bash
terraform init
```

---

# Lab 10 — Modules

Topics

- Local Modules
- Reusable Modules
- Module Outputs

Structure

```
modules/
   ec2/
   vpc/
   security-group/
```

---

# Lab 11 — Workspaces

Create

```bash
terraform workspace new dev
```

List

```bash
terraform workspace list
```

Switch

```bash
terraform workspace select prod
```

Delete

```bash
terraform workspace delete dev
```

---

# Lab 12 — Provisioners

Topics

- local-exec
- remote-exec
- file provisioner

---

# Lab 13 — EC2

Create

- EC2 Instance
- Key Pair
- Elastic IP

Verify

```bash
aws ec2 describe-instances
```

---

# Lab 14 — VPC

Provision

- VPC
- Public Subnet
- Private Subnet
- Internet Gateway
- Route Table
- NAT Gateway

Verify

```bash
aws ec2 describe-vpcs
```

---

# Lab 15 — Amazon S3

Create

- Bucket
- Versioning
- Lifecycle Policy
- Encryption

Verify

```bash
aws s3 ls
```

---

# Lab 16 — IAM

Create

- IAM User
- IAM Role
- IAM Policy

Verify

```bash
aws iam list-users
```

---

# Lab 17 — Security Groups

Topics

- Inbound Rules
- Outbound Rules
- SSH
- HTTP
- HTTPS

---

# Lab 18 — Load Balancer

Deploy

- Application Load Balancer
- Target Group
- Listener

---

# Lab 19 — Auto Scaling

Create

- Launch Template
- Auto Scaling Group

Verify

```bash
aws autoscaling describe-auto-scaling-groups
```

---

# Lab 20 — Amazon RDS

Provision

- MySQL
- PostgreSQL

Topics

- Parameter Groups
- Backups
- Multi-AZ

---

# Lab 21 — Amazon ECR

Create Repository

Push Docker Image

```bash
docker push
```

---

# Lab 22 — Amazon ECS

Deploy

- ECS Cluster
- Task Definition
- ECS Service

---

# Lab 23 — AWS Lambda

Deploy

- Lambda Function
- IAM Role
- CloudWatch Logs

---

# Lab 24 — CloudWatch

Topics

- Log Groups
- Alarms
- Dashboards

---

# Lab 25 — DynamoDB

Create

- Table
- Items
- Indexes

---

# Lab 26 — Route53

Configure

- Hosted Zone
- A Record
- CNAME

---

# Lab 27 — CloudFront

Create

- Distribution
- S3 Origin
- Cache Behavior

---

# Lab 28 — End-to-End Project

Build a Production Infrastructure

Deploy

- VPC
- Public & Private Subnets
- NAT Gateway
- EC2
- ALB
- Auto Scaling
- RDS
- S3
- IAM
- CloudWatch

---

# Terraform Commands Cheat Sheet

```bash
terraform init
terraform validate
terraform fmt
terraform plan
terraform apply
terraform destroy
terraform show
terraform output
terraform refresh
terraform taint
terraform untaint
terraform state list
terraform state show
terraform import
terraform workspace list
terraform workspace new
terraform workspace select
terraform graph
```

---

# Terraform Lifecycle

```
Terraform Code
      │
      ▼
terraform init
      │
      ▼
terraform validate
      │
      ▼
terraform fmt
      │
      ▼
terraform plan
      │
      ▼
terraform apply
      │
      ▼
Infrastructure
      │
      ▼
terraform destroy
```

---

# Best Practices

- Store state remotely.
- Enable state locking.
- Never commit secrets.
- Use variables instead of hardcoding values.
- Organize reusable modules.
- Follow consistent naming conventions.
- Use workspaces for multiple environments.
- Keep resources modular.
- Use version constraints.
- Validate and format code before applying.
- Review every execution plan.

---

# Learning Outcomes

After completing this lab, you will be able to:

- Write reusable Terraform code.
- Provision AWS infrastructure.
- Manage Terraform state.
- Use modules and workspaces.
- Deploy production-ready AWS environments.
- Automate infrastructure provisioning.
- Follow Infrastructure as Code best practices.
- Troubleshoot Terraform deployments.

---

# References

- Terraform Documentation: https://developer.hashicorp.com/terraform/docs
- AWS Provider Documentation: https://registry.terraform.io/providers/hashicorp/aws/latest/docs
- Terraform Registry: https://registry.terraform.io/
- AWS CLI Documentation: https://docs.aws.amazon.com/cli/

---

## Author

**Anurag Sharma**

DevOps | Cloud Engineer | AWS | Terraform | Kubernetes | Docker