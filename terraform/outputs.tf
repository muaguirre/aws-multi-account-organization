# Terraform Outputs
# These outputs expose useful identifiers created by the AWS Organizations configuration.

output "organization_id" {
  description = "ID of the AWS Organization."
  value       = aws_organizations_organization.main.id
}

output "organization_arn" {
  description = "ARN of the AWS Organization."
  value       = aws_organizations_organization.main.arn
}

output "security_ou_id" {
  description = "ID of the Security Organizational Unit."
  value       = aws_organizations_organizational_unit.security.id
}

output "infrastructure_ou_id" {
  description = "ID of the Infrastructure Organizational Unit."
  value       = aws_organizations_organizational_unit.infrastructure.id
}

output "development_ou_id" {
  description = "ID of the Development Organizational Unit."
  value       = aws_organizations_organizational_unit.development.id
}

output "production_ou_id" {
  description = "ID of the Production Organizational Unit."
  value       = aws_organizations_organizational_unit.production.id
}

output "deny_root_user_policy_id" {
  description = "ID of the SCP that denies root user actions."
  value       = aws_organizations_policy.deny_root_user.id
}

output "restrict_regions_policy_id" {
  description = "ID of the SCP that restricts AWS regions."
  value       = aws_organizations_policy.restrict_regions.id
}

output "security_account_id" {
  description = "ID of the Security Account."
  value       = aws_organizations_account.security.id
}

output "log_archive_account_id" {
  description = "ID of the Log Archive Account."
  value       = aws_organizations_account.log_archive.id
}

output "shared_services_account_id" {
  description = "ID of the Shared Services Account."
  value       = aws_organizations_account.shared_services.id
}

output "development_account_id" {
  description = "ID of the Development Account."
  value       = aws_organizations_account.development.id
}

output "production_account_id" {
  description = "ID of the Production Account."
  value       = aws_organizations_account.production.id
}
