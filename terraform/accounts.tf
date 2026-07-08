# AWS Accounts
# These accounts represent a multi-account AWS Organization structure.

resource "aws_organizations_account" "security" {
  name      = "Security Account"
  email     = "security@example.com"
  parent_id = aws_organizations_organizational_unit.security.id

  tags = {
    Environment = "Security"
    Purpose     = "Centralized security monitoring"
    ManagedBy   = "Terraform"
  }
}

resource "aws_organizations_account" "log_archive" {
  name      = "Log Archive Account"
  email     = "log-archive@example.com"
  parent_id = aws_organizations_organizational_unit.security.id

  tags = {
    Environment = "Security"
    Purpose     = "Centralized logging and audit storage"
    ManagedBy   = "Terraform"
  }
}

resource "aws_organizations_account" "shared_services" {
  name      = "Shared Services Account"
  email     = "shared-services@example.com"
  parent_id = aws_organizations_organizational_unit.infrastructure.id

  tags = {
    Environment = "Infrastructure"
    Purpose     = "Shared networking and platform services"
    ManagedBy   = "Terraform"
  }
}

resource "aws_organizations_account" "development" {
  name      = "Development Account"
  email     = "development@example.com"
  parent_id = aws_organizations_organizational_unit.development.id

  tags = {
    Environment = "Development"
    Purpose     = "Development and non-production workloads"
    ManagedBy   = "Terraform"
  }
}

resource "aws_organizations_account" "production" {
  name      = "Production Account"
  email     = "production@example.com"
  parent_id = aws_organizations_organizational_unit.production.id

  tags = {
    Environment = "Production"
    Purpose     = "Production workloads"
    ManagedBy   = "Terraform"
  }
}
