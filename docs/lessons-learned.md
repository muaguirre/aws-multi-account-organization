# Lessons Learned

## Overview

This document summarizes the main technical lessons learned while designing the AWS Multi-Account Organization Architecture project.

The project focuses on AWS Organizations, multi-account governance, Service Control Policies, account separation and Infrastructure as Code with Terraform.

---

## 1. AWS Organizations Hierarchy

AWS Organizations allows multiple AWS accounts to be managed centrally.

The hierarchy used in this project is:

```text
AWS Organizations
│
├── Management Account
│
├── Organizational Units
│   ├── Security OU
│   ├── Infrastructure OU
│   ├── Development OU
│   └── Production OU
│
└── Member Accounts
    ├── Security Account
    ├── Log Archive Account
    ├── Shared Services Account
    ├── Development Account
    └── Production Account
```

Key lesson:

> A well-designed account structure improves security, governance, billing visibility and operational separation.

---

## 2. Management Account Best Practices

The Management Account should not be used to run workloads.

Its main purpose is to manage:

- AWS Organizations
- Consolidated billing
- Account creation
- Service Control Policies
- Delegated administration

Key lesson:

> The Management Account should be protected with strict access control and MFA because it has organization-level privileges.

---

## 3. Organizational Units

Organizational Units help group accounts by function, environment or business area.

In this project, OUs are used to separate:

- Security operations
- Shared infrastructure
- Development workloads
- Production workloads

Key lesson:

> OUs make it easier to apply policies consistently across multiple accounts while keeping environments logically separated.

---

## 4. Development and Production Separation

Development and production should be separated into different accounts and Organizational Units.

This allows each environment to have different:

- Access controls
- Budget limits
- Monitoring requirements
- Change management processes
- Service Control Policies

Key lesson:

> Production environments should have stricter controls than development environments because they usually host business-critical workloads.

---

## 5. Service Control Policies

Service Control Policies define the maximum permissions available to accounts in an organization.

Important concept:

> SCPs do not grant permissions. They only limit what is allowed.

For example, if an IAM user has administrator permissions but an SCP denies access to a service or action, the SCP takes precedence and the action is denied.

Key lesson:

> SCPs are preventive guardrails used to enforce organization-wide security and governance rules.

---

## 6. SCP Precedence

Permissions in AWS depend on several policy layers.

A user or role can perform an action only if:

- The IAM policy allows it.
- No SCP denies it.
- No permissions boundary denies it.
- No resource policy or other control denies it.

Key lesson:

> An explicit deny in an SCP overrides an allow in IAM.

---

## 7. Root User Security

The AWS root user has unrestricted access to the account.

For this reason, it should not be used for daily administration.

This project includes an SCP example to deny root user actions.

Key lesson:

> Root user usage should be minimized, MFA should be enabled and administrative tasks should be performed through IAM roles or IAM Identity Center.

---

## 8. Region Restriction

Restricting AWS regions helps improve governance and cost control.

Benefits include:

- Reducing accidental deployments.
- Improving compliance.
- Centralizing operations in approved regions.
- Avoiding unexpected costs.

Key lesson:

> Region restriction SCPs must consider global AWS services such as IAM, Route 53, CloudFront and AWS Organizations.

---

## 9. Centralized Logging

A dedicated Log Archive Account improves auditability and incident response.

Logs should be separated from workload accounts to reduce the risk of deletion or tampering.

Key lesson:

> Centralized logging helps preserve evidence and improves visibility across the organization.

---

## 10. Centralized Security Monitoring

A dedicated Security Account improves visibility across the organization.

It can aggregate findings from services such as:

- AWS Security Hub
- Amazon GuardDuty
- IAM Access Analyzer

Key lesson:

> Centralized security monitoring helps detect issues across multiple accounts instead of reviewing each account separately.

---

## 11. Shared Services

The Shared Services Account is used for common infrastructure and platform services.

Examples include:

- Networking components
- DNS resources
- CI/CD tooling
- Common platform services

Key lesson:

> Shared services should be separated from development and production workloads to improve governance and reduce operational complexity.

---

## 12. Infrastructure as Code

Terraform allows infrastructure and governance controls to be defined as code.

Benefits include:

- Version control
- Repeatability
- Better review process
- Reduced manual configuration
- Improved traceability

Key lesson:

> Infrastructure as Code improves consistency and reduces the risk of manual misconfiguration.

---

## 13. Terraform State Management

Terraform state can contain sensitive information.

For that reason, state files should not be committed to public repositories.

Key lesson:

> Terraform state should be stored securely, usually in a remote backend such as Amazon S3 with encryption and state locking.

---

## 14. Scaling to Enterprise Environments

A multi-account structure can scale from a small environment to a large enterprise.

As the organization grows, more OUs and accounts can be added for:

- Business units
- Applications
- Environments
- Compliance requirements
- Security operations
- Shared services
- Sandbox environments

Key lesson:

> A strong account and OU strategy makes it easier to scale cloud governance across many teams and workloads.

---

## Summary

This project helped reinforce important AWS cloud architecture concepts:

- Multi-account design
- AWS Organizations hierarchy
- Development and production separation
- SCP behavior
- IAM and permission boundaries
- Centralized security
- Centralized logging
- Terraform-based governance
- Cost and region control
