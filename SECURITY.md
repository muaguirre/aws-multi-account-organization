# Security Policy

## Purpose

This repository is a portfolio and learning project focused on AWS Organizations, multi-account governance, Service Control Policies and Terraform.

No real credentials, access keys, secrets or sensitive AWS account information should be committed to this repository.

---

## Security Best Practices

The following security practices should be followed when working with this project:

- Do not commit AWS access keys.
- Do not commit Terraform state files.
- Do not commit `.tfvars` files containing sensitive values.
- Do not expose AWS account IDs in public screenshots.
- Do not expose billing information.
- Use IAM roles instead of long-term access keys.
- Enable MFA on the AWS Management Account.
- Avoid running workloads in the Management Account.
- Use centralized logging with a dedicated Log Archive Account.
- Apply Service Control Policies carefully and test them before production use.

---

## Terraform Security Notes

Terraform can generate local files that may contain sensitive information.

The `.gitignore` file in this repository excludes common Terraform files such as:

- `.terraform/`
- `*.tfstate`
- `*.tfvars`
- Terraform plan files
- Local environment files

---

## Reporting Security Issues

This project is for educational and portfolio purposes.

If a security issue is found in the example code or documentation, it should be reviewed and corrected before using the project as a reference for real environments.
