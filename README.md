# AWS Multi-Account Organization Architecture

![AWS](https://img.shields.io/badge/AWS-Organizations-orange)
![Terraform](https://img.shields.io/badge/Terraform-IaC-purple)
![Security](https://img.shields.io/badge/Focus-Cloud%20Security-blue)
![Status](https://img.shields.io/badge/Status-Portfolio%20Project-green)

## Overview

This project presents a multi-account cloud architecture using **AWS Organizations**.

The goal is to design a secure, scalable and well-governed AWS environment by separating cloud responsibilities into multiple AWS accounts, applying centralized security controls and improving cost visibility through consolidated billing.

---

## Architecture Objectives

- Separate environments using different AWS accounts.
- Centralize governance with AWS Organizations.
- Apply Service Control Policies across accounts.
- Improve security by reducing the blast radius.
- Centralize logging and security monitoring.
- Control costs through consolidated billing.
- Restrict resource deployment to approved AWS regions.
- Define the organization structure using Infrastructure as Code.
- Separate development and production environments into dedicated Organizational Units.

---

## Proposed Account Structure

```text
AWS Organizations
│
├── Management Account
│
├── Security OU
│   ├── Security Account
│   └── Log Archive Account
│
├── Infrastructure OU
│   └── Shared Services Account
│
├── Development OU
│   └── Development Account
│
└── Production OU
    └── Production Account
```

---

## Repository Structure

```text
aws-multi-account-organization/
│
├── architecture/
│   └── organization-diagram.md
│
├── docs/
│   ├── implementation-guide.md
│   ├── security-controls.md
│   ├── lessons-learned.md
│   └── scaling-to-enterprise.md
│    
├── policies/
│   ├── deny-root-user-scp.json
│   └── restrict-regions-scp.json
│
├── terraform/
│   ├── main.tf
│   ├── organizational-units.tf
│   ├── accounts.tf
│   ├── scp.tf
│   └── README.md
│
├── .gitignore
├── SECURITY.md
├── LICENSE
└── README.md
```

---

## AWS Services Used

- AWS Organizations
- Service Control Policies
- AWS Identity and Access Management
- AWS IAM Identity Center
- AWS CloudTrail
- AWS Config
- AWS Security Hub
- Amazon GuardDuty
- AWS Billing and Cost Management

---

## Terraform Infrastructure as Code

This project includes Terraform example files to define the AWS Organizations structure as Infrastructure as Code.

Terraform files included:

```text
├── terraform/
│   ├── main.tf
│   ├── variables.tf
│   ├── outputs.tf
│   ├── organizational-units.tf
│   ├── accounts.tf
│   ├── scp.tf
│   └── README.md
```

The Terraform configuration defines:

- AWS Organizations setup.
- Organizational Units for security, infrastructure, development and production.
- Example AWS accounts for each area of the organization.
- Service Control Policies.
- SCP attachments to Organizational Units.
- Reusable variables for provider region, approved regions, account email domain and common tags.
- Outputs for organization, OU, account and SCP identifiers.

> Note: This Terraform code is designed as a portfolio and learning example. Before applying it in a real AWS environment, account emails, provider configuration and organizational requirements should be reviewed.

---

## Service Control Policies Included

This project includes example SCPs for governance and security.

### Deny Root User Actions

File:

```text
policies/deny-root-user-scp.json
```

Terraform equivalent:

```text
terraform/scp.tf
```

Purpose:

- Prevent daily usage of the AWS root user.
- Reduce security risk.
- Enforce better identity management practices.

### Restrict AWS Regions

File:

```text
policies/restrict-regions-scp.json
```

Terraform equivalent:

```text
terraform/scp.tf
```

Purpose:

- Deny resource deployment outside approved European AWS regions.
- Reduce accidental costs.
- Support compliance and governance requirements.

---

## Security Benefits

This architecture helps improve cloud security by:

- Isolating security, infrastructure, development and production responsibilities.
- Centralizing logs in a dedicated Log Archive Account.
- Centralizing security monitoring in a dedicated Security Account.
- Applying preventive controls with SCPs.
- Reducing the impact of compromised credentials.
- Avoiding workloads in the Management Account.
- Managing governance controls through Infrastructure as Code.

---

## Cost Management Benefits

This architecture improves cost management by:

- Using consolidated billing.
- Separating costs by account and environment.
- Improving visibility across accounts.
- Supporting budgets and alerts per account.
- Reducing unauthorized deployments in non-approved regions.
- Supporting future FinOps practices through account separation and tagging.

---

## Documentation

Detailed documentation is available here:

- [Implementation Guide](docs/implementation-guide.md)
- [Architecture Diagram](architecture/organization-diagram.md)
- [Security Controls](docs/security-controls.md)
- [Lessons Learned](docs/lessons-learned.md)
- [Scaling to Enterprise](docs/scaling-to-enterprise.md)
- [Terraform Documentation](terraform/README.md)
- [Security Policy](SECURITY.md)

---

## Project Status

This is a portfolio project designed to demonstrate knowledge of AWS Organizations, multi-account governance, security controls, Infrastructure as Code and cloud architecture best practices.

Future improvements may include:

- Real AWS console screenshots.
- Terraform plan and apply screenshots.
- Additional SCP examples.
- AWS IAM Identity Center documentation.
- CloudTrail and AWS Config centralized logging examples.
- Enterprise scaling model for larger organizations.

---

## Author

Created by **Eric Muñoz Aguirre**.

This project is part of my AWS Cloud portfolio, focused on cloud governance, security, Infrastructure as Code and multi-account architecture.
