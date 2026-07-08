# AWS Organizations Architecture Diagram

This document describes the logical structure of the AWS multi-account organization.

## Logical Structure

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

## Purpose

The goal of this architecture is to separate AWS environments into different accounts, apply centralized security policies and improve governance across the organization.

---

## Organizational Design

### Management Account

Used for AWS Organizations administration, consolidated billing, account creation and Service Control Policy management.

This account should not be used to run workloads.

### Security OU

Used to centralize security monitoring and audit-related services.

Accounts:

- Security Account
- Log Archive Account

### Infrastructure OU

Used for shared infrastructure services used by multiple environments.

Accounts:

- Shared Services Account

### Development OU

Used for non-production workloads, testing, experimentation and development activities.

Accounts:

- Development Account

### Production OU

Used for production workloads with stricter access control, monitoring and security policies.

Accounts:

- Production Account

---

## Design Rationale

This structure separates security, shared infrastructure, development and production responsibilities into dedicated Organizational Units.

This makes it easier to apply different Service Control Policies depending on the environment. For example, production accounts can have stricter controls than development accounts.
