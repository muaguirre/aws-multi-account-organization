# Terraform Outputs

output "security_ou_id" {
  description = "ID of the Security Organizational Unit"
  value       = aws_organizations_organizational_unit.security.id
}

output "infrastructure_ou_id" {
  description = "ID of the Infrastructure Organizational Unit"
  value       = aws_organizations_organizational_unit.infrastructure.id
}

output "development_ou_id" {
  description = "ID of the Development Organizational Unit"
  value       = aws_organizations_organizational_unit.development.id
}

output "production_ou_id" {
  description = "ID of the Production Organizational Unit"
  value       = aws_organizations_organizational_unit.production.id
}
