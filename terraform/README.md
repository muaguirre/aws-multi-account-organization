# Terraform - AWS Organizations

## Overview

This folder contains Terraform example code for defining a multi-account AWS Organization using Infrastructure as Code.

The configuration creates:

- AWS Organization
- Organizational Units
- Example AWS accounts
- Service Control Policies
- SCP attachments to Organizational Units
- Terraform variables for reusable configuration
- Terraform outputs for important resource identifiers

---

## File Structure

```text
terraform/
├── main.tf
├── variables.tf
├── outputs.tf
├── organizational-units.tf
├── accounts.tf
├── scp.tf
└── README.md
```

---

## Files Description

### main.tf

Defines the base Terraform configuration, AWS provider and the AWS Organization.

The AWS provider region is configured using the `aws_region` variable.

### variables.tf

Defines reusable variables used by the Terraform configuration.

Included variables:

- `aws_region`
- `approved_regions`
- `account_email_domain`
- `common_tags`

These variables help avoid hardcoded values and make the configuration easier to adapt.

### outputs.tf

Defines Terraform outputs for important created resources.

Included outputs:

- AWS Organization ID
- AWS Organization ARN
- Organizational Unit IDs
- AWS account IDs
- Service Control Policy IDs

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

Account email addresses are generated using the `account_email_domain` variable.

Common tags are applied using the `common_tags` variable.

### scp.tf

Defines Service Control Policies and attaches them to the appropriate Organizational Units.

Included SCPs:

- Deny root user actions
- Restrict deployments outside approved European regions

The approved AWS regions are managed using the `approved_regions` variable.

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

## Variables

### aws_region

Default value:

```hcl
"eu-west-1"
```

Used by the AWS provider.

### approved_regions

Default values:

```hcl
[
  "eu-west-1",
  "eu-west-2",
  "eu-west-3",
  "eu-south-1",
  "eu-central-1"
]
```

Used by the region restriction SCP.

### account_email_domain

Default value:

```hcl
"example.com"
```

Used to generate example AWS account email addresses.

### common_tags

Default values:

```hcl
{
  ManagedBy = "Terraform"
  Project   = "AWS Multi-Account Organization"
}
```

Applied to the example AWS accounts.

---

## Outputs

After applying the configuration, Terraform can return useful identifiers such as:

```text
organization_id
organization_arn
security_ou_id
infrastructure_ou_id
development_ou_id
production_ou_id
deny_root_user_policy_id
restrict_regions_policy_id
security_account_id
log_archive_account_id
shared_services_account_id
development_account_id
production_account_id
```

These outputs help document the resources created by Terraform.

---

## Important Notes

This Terraform code is designed for portfolio and learning purposes.

Before applying it in a real AWS environment, review and replace:

- Example account email addresses
- AWS provider configuration
- Organization naming standards
- SCP scope and exceptions
- Billing and compliance requirements
- Terraform backend configuration
- Remote state storage strategy

Terraform state files can contain sensitive information and should not be committed to public repositories.

---

## Example Workflow

```bash
terraform init
terraform plan
terraform apply
```

> This code should not be applied directly to a production AWS environment without proper review.
