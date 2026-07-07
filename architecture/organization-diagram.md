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
└── Workloads OU
    ├── Development Account
    ├── Testing Account
    └── Production Account
```

## Purpose

The goal of this architecture is to separate AWS environments into different accounts, apply centralized security policies and improve governance across the organization.
