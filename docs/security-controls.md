# Security Controls

## Overview

This document describes the main security controls included in the AWS Multi-Account Organization Architecture project.

The objective is to define preventive, detective and organizational controls for a secure multi-account AWS environment.

---

## Control 1: Management Account Isolation

### Purpose

The Management Account should only be used for AWS Organizations administration, consolidated billing and organization-level governance.

### Risk Addressed

Running workloads in the Management Account increases the blast radius of a security incident and exposes the most privileged account in the organization.

### Implementation

- Avoid deploying workloads in the Management Account.
- Restrict access to a small number of administrators.
- Enable MFA for privileged users.
- Use the Management Account only for organization-level tasks.
- Use delegated administration where possible.

---

## Control 2: Dedicated Security OU

### Purpose

The Security OU contains accounts focused on security monitoring, auditability and incident response.

### Risk Addressed

Without dedicated security accounts, monitoring and audit data may be spread across multiple workload accounts, reducing visibility and increasing operational risk.

### Implementation

The Security OU contains:

- Security Account
- Log Archive Account

---

## Control 3: Dedicated Security Account

### Purpose

A dedicated Security Account centralizes security services and monitoring.

### Risk Addressed

Without centralized security monitoring, threats may go undetected across member accounts.

### Implementation

The Security Account can be used for:

- AWS Security Hub
- Amazon GuardDuty
- IAM Access Analyzer
- Centralized incident response
- Security findings aggregation

---

## Control 4: Dedicated Log Archive Account

### Purpose

A dedicated Log Archive Account stores security and audit logs separately from workload accounts.

### Risk Addressed

If logs are stored in the same account as workloads, an attacker with access to that account could delete or modify evidence.

### Implementation

The Log Archive Account can be used for:

- Centralized AWS CloudTrail logs
- AWS Config logs
- Long-term audit storage
- Separation of logs from application accounts
- Protection of audit evidence

---

## Control 5: Infrastructure OU Separation

### Purpose

The Infrastructure OU contains shared services used by multiple environments.

### Risk Addressed

Mixing shared services with production or development workloads can make governance, access control and troubleshooting more difficult.

### Implementation

The Infrastructure OU contains:

- Shared Services Account

This account can host shared services such as:

- Networking components
- Shared DNS resources
- CI/CD tooling
- Centralized platform services

---

## Control 6: Development and Production Separation

### Purpose

Development and production workloads should be separated into different Organizational Units and accounts.

### Risk Addressed

A misconfiguration or incident in a development environment should not directly affect production workloads.

### Implementation

The architecture separates:

- Development OU
  - Development Account
- Production OU
  - Production Account

This allows different policies, budgets and access controls to be applied depending on the environment.

---

## Control 7: Production Account Protection

### Purpose

The Production Account should have stricter security and access controls than development environments.

### Risk Addressed

Production workloads are usually business-critical. Misconfigurations, excessive permissions or accidental changes can cause service outages or security incidents.

### Implementation

Recommended production controls include:

- Restricted administrative access
- Stronger SCP guardrails
- Centralized logging
- Centralized monitoring
- Change control
- Budget alerts
- Anomaly detection
- MFA for privileged access

---

## Control 8: Service Control Policies

### Purpose

Service Control Policies define the maximum available permissions for accounts in the organization.

### Risk Addressed

Even if a user has administrator permissions inside an account, SCPs can prevent high-risk actions at the organization level.

### Implementation

This project includes the following SCP examples:

- Deny root user actions
- Restrict AWS regions outside approved European regions

Terraform implementation:

- `terraform/scp.tf`

---

## Control 9: Root User Usage Prevention

### Purpose

The AWS root user should not be used for daily operations.

### Risk Addressed

The root user has unrestricted access to the AWS account. If compromised, it can create a critical security incident.

### Implementation

The `deny-root-user-scp.json` policy denies actions performed by the AWS root user.

### Important Scope Note

This SCP is intended to restrict root user actions in AWS member accounts.

Service Control Policies do not affect the Management Account. For the Management Account, root user protection must be handled through operational security best practices such as MFA, restricted access and avoiding root access keys.

---

## Control 10: Region Restriction

### Purpose

Restrict AWS resource deployment to approved regions.

### Risk Addressed

Resources deployed in unauthorized regions can increase costs, create compliance issues and reduce operational visibility.

### Implementation

The `restrict-regions-scp.json` policy denies AWS actions outside approved European regions while excluding required global services.

Approved regions:

- eu-west-1
- eu-west-2
- eu-west-3
- eu-south-1
- eu-central-1

---

## Control 11: Infrastructure as Code Governance

### Purpose

Terraform is used to define organization structure and security controls as code.

### Risk Addressed

Manual changes can reduce traceability and increase the risk of misconfiguration.

### Implementation

Terraform files define:

- AWS Organization
- Organizational Units
- Example AWS accounts
- Service Control Policies
- SCP attachments

---

## Summary

This project applies a layered security approach using account separation, dedicated Organizational Units, centralized monitoring, dedicated log storage, preventive SCP controls and Infrastructure as Code.
