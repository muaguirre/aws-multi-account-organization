# Security Controls

## Overview

This document describes the main security controls included in the AWS Multi-Account Organization Architecture project.

The objective is to define preventive, detective and organizational controls for a secure multi-account AWS environment.

---

## Control 1: Management Account Isolation

### Purpose

The Management Account should only be used for AWS Organizations administration and consolidated billing.

### Risk Addressed

Running workloads in the Management Account increases the impact of a security incident.

### Implementation

- Avoid deploying workloads in the Management Account.
- Restrict access to a small number of administrators.
- Enable MFA for privileged users.
- Use the Management Account only for organization-level tasks.

---

## Control 2: Dedicated Security Account

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

---

## Control 3: Dedicated Log Archive Account

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

---

## Control 4: Service Control Policies

### Purpose

Service Control Policies define the maximum available permissions for accounts in the organization.

### Risk Addressed

Even if a user has administrator permissions inside an account, SCPs can prevent high-risk actions at the organization level.

### Implementation

This project includes the following SCP examples:

- Deny root user actions
- Restrict AWS regions outside approved European regions

---

## Control 5: Root User Usage Prevention

### Purpose

The AWS root user should not be used for daily operations.

### Risk Addressed

The root user has unrestricted access to the AWS account. If compromised, it can create a critical security incident.

### Implementation

The `deny-root-user-scp.json` policy denies actions performed by the AWS root user.

---

## Control 6: Region Restriction

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

## Control 7: Environment Isolation

### Purpose

Development, testing and production environments should be separated into different AWS accounts.

### Risk Addressed

A misconfiguration or incident in a development environment should not directly affect production workloads.

### Implementation

The Workloads OU contains separate accounts for:

- Development
- Testing
- Production

---

## Control 8: Infrastructure as Code Governance

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

This project applies a layered security approach using account separation, centralized monitoring, dedicated log storage, preventive SCP controls and Infrastructure as Code.
