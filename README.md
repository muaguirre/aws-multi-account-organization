# AWS Multi-Account Organization Architecture

## Overview

This project presents a multi-account cloud architecture using **AWS Organizations**.

The goal is to design a secure, scalable and well-governed AWS environment by separating workloads into multiple accounts, applying centralized security controls and improving cost visibility through consolidated billing.

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
└── Workloads OU
    ├── Development Account
    ├── Testing Account
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
│   └── implementation-guide.md
│
├── policies/
│   ├── deny-root-user-scp.json
│   └── restrict-regions-scp.json
│
├── terraform/
│   ├── main.tf
│   ├── organizational-units.tf
│   ├── accounts.tf
│   └── scp.tf
│
├── LICENSE
└── README.md
```

---

## AWS Services Used

- AWS Organizations
- Service Control Policies
- AWS Identity and Access Management
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
terraform/
├── main.tf
├── organizational-units.tf
├── accounts.tf
└── scp.tf
```

The Terraform configuration defines:

- AWS Organizations setup.
- Organizational Units for security, infrastructure and workloads.
- Example AWS accounts for each environment.
- Service Control Policies.
- SCP attachments to Organizational Units.

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

- Isolating production, testing and development environments.
- Centralizing logs in a dedicated account.
- Applying preventive controls with SCPs.
- Reducing the impact of compromised credentials.
- Avoiding workloads in the Management Account.
- Managing governance controls through Infrastructure as Code.

---

## Cost Management Benefits

This architecture improves cost management by:

- Using consolidated billing.
- Separating costs by environment.
- Improving visibility across accounts.
- Supporting budgets and alerts per account.
- Reducing unauthorized deployments in non-approved regions.

---

## Documentation

Detailed documentation is available here:

- [Implementation Guide](docs/implementation-guide.md)
- [Architecture Diagram](architecture/organization-diagram.md)

---

## Project Status

This is a portfolio project designed to demonstrate knowledge of AWS Organizations, multi-account governance, security controls, Infrastructure as Code and cloud architecture best practices.

---

## Author

Created by **Eric Muñoz Aguirre**.

This project is part of my AWS Cloud portfolio, focused on cloud governance, security, Infrastructure as Code and multi-account architecture.
