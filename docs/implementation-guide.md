# AWS Organizations Implementation Guide

## 1. Overview

This document explains the implementation approach for a multi-account AWS environment using AWS Organizations.

The objective of this design is to improve governance, security, billing control and environment separation by using multiple AWS accounts grouped into dedicated Organizational Units.

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
├── Development OU
│   └── Development Account
│
└── Production OU
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
- Enable MFA for privileged access.

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
- Security findings aggregation.

### Log Archive Account

Used for:

- Centralized CloudTrail logs.
- AWS Config logs.
- Long-term audit storage.
- Separation of logs from workload accounts.
- Protection of audit evidence.

---

## 5. Infrastructure OU

The Infrastructure OU contains shared services used by multiple environments.

### Shared Services Account

Used for:

- Shared networking components.
- Shared DNS resources.
- CI/CD tools.
- Centralized platform services.
- Common services used by development and production environments.

---

## 6. Development OU

The Development OU contains non-production workloads.

### Development Account

Used for:

- Application development.
- Testing new cloud services.
- Experimentation.
- Non-production deployments.
- Lower-risk environments.

Recommended controls:

- Region restrictions.
- Budget alerts.
- Basic SCP guardrails.
- Controlled access for developers.

---

## 7. Production OU

The Production OU contains production workloads.

### Production Account

Used for:

- Production applications.
- Business-critical workloads.
- Customer-facing services.
- Stable and controlled deployments.

Recommended controls:

- Stricter SCPs.
- Restricted administrative access.
- Centralized monitoring.
- Centralized logging.
- Change control.
- Budget and anomaly detection alerts.

---

## 8. Service Control Policies

Service Control Policies define the maximum permissions available to accounts inside the organization.

Important note:

SCPs do not grant permissions. They only define permission boundaries at the AWS Organizations level.

Examples included in this project:

- `deny-root-user-scp.json`
- `restrict-regions-scp.json`

Terraform implementation:

- `terraform/scp.tf`

---

## 9. Terraform Implementation

This project includes Terraform example code to define the AWS Organizations structure as Infrastructure as Code.

Terraform files included:

```text
terraform/
├── main.tf
├── organizational-units.tf
├── accounts.tf
├── scp.tf
└── README.md
```

The Terraform configuration defines:

- AWS Organization setup.
- Organizational Units.
- Example AWS accounts.
- Service Control Policies.
- SCP attachments to OUs.

---

## 10. Security Benefits

This architecture improves security by:

- Separating environments into different AWS accounts.
- Reducing the blast radius of incidents.
- Centralizing security monitoring.
- Preventing the use of the root user.
- Restricting deployments to approved regions.
- Keeping audit logs isolated from workload accounts.
- Applying different controls to development and production environments.

---

## 11. Cost Control Benefits

This architecture improves cost control by:

- Using consolidated billing.
- Separating costs by account and environment.
- Making it easier to apply budgets and alerts.
- Reducing accidental deployments in unauthorized regions.
- Supporting future FinOps practices through tagging and account separation.

---

## 12. Scaling Considerations

This architecture can scale to larger organizations by adding more OUs and accounts.

Examples:

- Separate OUs per business unit.
- Separate accounts per application.
- Separate accounts per environment.
- Dedicated compliance accounts.
- Dedicated networking accounts.
- Dedicated sandbox accounts.

A company with 100 AWS accounts could use the same model and expand it with additional layers of governance.

---

## 13. Conclusion

A multi-account AWS Organization provides a scalable and secure foundation for cloud environments.

This design follows AWS best practices for governance, environment isolation, centralized security, cost control and Infrastructure as Code.
