# Terraform - AWS Organizations

## Overview

This folder contains Terraform example code for defining a multi-account AWS Organization using Infrastructure as Code.

The configuration creates:

- AWS Organization
- Organizational Units
- Example AWS accounts
- Service Control Policies
- SCP attachments to Organizational Units

---

## File Structure

```text
terraform/
├── main.tf
├── organizational-units.tf
├── accounts.tf
├── scp.tf
└── README.md
```

---

## Files Description

### main.tf

Defines the Terraform configuration, AWS provider and the base AWS Organization.

### organizational-units.tf

Creates the main Organizational Units:

- Security
- Infrastructure
- Development
- Production

### accounts.tf

Defines example AWS accounts for each area of the organization:

- Security Account
- Log Archive Account
- Shared Services Account
- Development Account
- Production Account

### scp.tf

Defines Service Control Policies and attaches them to the appropriate Organizational Units.

Included SCPs:

- Deny root user actions
- Restrict deployments outside approved European regions

---

## Organizational Unit Design

```text
AWS Organizations
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

## SCP Attachment Strategy

The Terraform configuration applies SCPs as follows:

```text
Security OU        → Deny root user actions
Infrastructure OU  → Deny root user actions
Development OU     → Deny root user actions + restrict regions
Production OU      → Deny root user actions + restrict regions
```

This allows common security guardrails to be applied across the organization while keeping workload-related restrictions focused on development and production environments.

---

## Important Notes

This Terraform code is designed for portfolio and learning purposes.

Before applying it in a real AWS environment, review and replace:

- Example account email addresses
- AWS provider configuration
- Organization naming standards
- SCP scope and exceptions
- Billing and compliance requirements

---

## Example Workflow

```bash
terraform init
terraform plan
terraform apply
```

> This code should not be applied directly to a production AWS environment without proper review.
