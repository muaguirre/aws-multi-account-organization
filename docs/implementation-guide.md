# AWS Organizations Implementation Guide

## 1. Overview

This document explains the implementation approach for a multi-account AWS environment using AWS Organizations.

The objective of this design is to improve governance, security, billing control and environment separation by using multiple AWS accounts grouped into Organizational Units.

---

## 2. Account Structure

The proposed AWS Organization is divided into the following accounts and Organizational Units:

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

## 3. Management Account

The Management Account is used only for organization-level administration.

Recommended usage:

- Manage AWS Organizations.
- Manage consolidated billing as the payer account.
- Delegate day-to-day cost monitoring to a FinOps or Cost Management team when required.
- Create and organize AWS accounts.
- Apply Service Control Policies.
- Avoid running workloads in this account.

---

## 4. Security OU

The Security OU contains accounts related to security operations and centralized monitoring.

### Security Account

Used for:

- Security monitoring.
- AWS Security Hub.
- Amazon GuardDuty.
- IAM Access Analyzer.
- Centralized incident response.

### Log Archive Account

Used for:

- Centralized CloudTrail logs.
- AWS Config logs.
- Long-term audit storage.
- Separation of logs from workload accounts.

---

## 5. Infrastructure OU

The Infrastructure OU contains shared services used by several environments.

### Shared Services Account

Used for:

- Networking components.
- Shared DNS resources.
- CI/CD tools.
- Centralized services used by development, testing and production.

---

## 6. Workloads OU

The Workloads OU contains the application environments.

### Development Account

Used by developers to test and deploy non-production resources.

### Testing Account

Used for validation, QA and pre-production testing.

### Production Account

Used only for production workloads.

This account should have stricter controls and fewer users with administrative access.

---

## 7. Service Control Policies

Service Control Policies define the maximum permissions available to accounts inside the organization.

Important note:

SCPs do not grant permissions. They only define permission boundaries at the AWS Organizations level.

Examples included in this project:

- `deny-root-user-scp.json`
- `restrict-regions-scp.json`

---

## 8. Security Benefits

This architecture improves security by:

- Separating environments into different AWS accounts.
- Reducing the blast radius of incidents.
- Centralizing security monitoring.
- Preventing the use of the root user.
- Restricting deployments to approved regions.
- Keeping audit logs isolated from workload accounts.

---

## 9. Cost Control Benefits

This architecture improves cost control by:

- Using consolidated billing.
- Separating costs by account and environment.
- Making it easier to apply budgets and alerts.
- Reducing accidental deployments in unauthorized regions.

---

## 10. Conclusion

A multi-account AWS Organization provides a scalable and secure foundation for cloud environments.

This design follows AWS best practices for governance, environment isolation, centralized security and billing management.
