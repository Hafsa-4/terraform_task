# Terraform Infrastructure CI/CD Pipeline

## Overview
This repository contains Terraform code to provision AWS infrastructure, with automated CI/CD pipelines using Jenkins.

## Repository Structure

terraform_task/

├── main.tf          # S3 bucket resource

├── provider.tf      # AWS provider configuration

├── variables.tf     # Input variables

├── outputs.tf       # Output values

├── Jenkinsfile-ci   # CI pipeline

└── Jenkinsfile-cd   # CD pipeline

## Infrastructure
- **Resource:** AWS S3 Bucket
- **Bucket Name:** `hafsa-terraform-task-demo-2026`
- **Region:** `ap-south-1` (Mumbai)
- **Tags:** Name, Environment, Owner, Team

## CI Pipeline (Jenkinsfile-ci)
Runs **before merging** into main branch.

### Stages
1. **Checkout** — clones the repository
2. **Terraform Format Check** — checks code formatting (`terraform fmt`)
3. **Terraform Init** — initializes providers (`terraform init -backend=false`)
4. **Terraform Validate** — validates configuration (`terraform validate`)
5. **Terraform Lint Check** — checks code quality (`tflint`)

## CD Pipeline (Jenkinsfile-cd)
Runs **manually only** after PR is merged into main.

### Stages
1. **Checkout** — clones main branch
2. **Terraform Init** — initializes providers and backend
3. **Terraform Plan** — shows what will be deployed
4. **Approval** — manual gate, human must approve before deploy
5. **Terraform Apply** — deploys infrastructure to AWS

## How to Use

### CI Flow
1. Create a new branch
2. Make changes to Terraform code
3. Open a Pull Request to main
4. Run `terraform-ci` job in Jenkins
5. Verify all stages pass
6. Merge PR if CI passes

### CD Flow
1. Merge PR into main
2. Go to Jenkins → `terraform-cd` → **Build Now**
3. Review the Terraform plan
4. Click **"Yes, Deploy Now"** to approve
5. Terraform applies changes to AWS

## Jenkins Setup
- **Jenkins** running on AWS EC2
- **AWS Credentials** stored securely in Jenkins Credentials Store
  - `AWS_ACCESS_KEY_ID`
  - `AWS_SECRET_ACCESS_KEY`
- **Region:** `ap-south-1`

## Tools Used
| Tool | Version | Purpose |
|------|---------|---------|
| Terraform | >= 1.5 | Infrastructure as Code |
| tflint | 0.63.1 | Terraform linting |
| Jenkins | 2.555.3 | CI/CD automation |
| AWS Provider | ~> 5.0 | AWS resource management |

