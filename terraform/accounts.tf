# AWS Accounts
# These accounts represent a multi-account AWS Organization structure.

resource "aws_organizations_account" "security" {
  name      = "Security Account"
  email     = "security@example.com"
  parent_id = aws_organizations_organizational_unit.security.id

  tags = {
    Environment = "Security"
    Purpose     = "Centralized security monitoring"
  }
}

resource "aws_organizations_account" "log_archive" {
  name      = "Log Archive Account"
  email     = "log-archive@example.com"
  parent_id = aws_organizations_organizational_unit.security.id

  tags = {
    Environment = "Security"
    Purpose     = "Centralized logging and audit storage"
  }
}

resource "aws_organizations_account" "shared_services" {
  name      = "Shared Services Account"
  email     = "shared-services@example.com"
  parent_id = aws_organizations_organizational_unit.infrastructure.id

  tags = {
    Environment = "Infrastructure"
    Purpose     = "Shared networking and platform services"
  }
}

resource "aws_organizations_account" "development" {
  name      = "Development Account"
  email     = "development@example.com"
  parent_id = aws_organizations_organizational_unit.workloads.id

  tags = {
    Environment = "Development"
    Purpose     = "Development workloads"
  }
}

resource "aws_organizations_account" "testing" {
  name      = "Testing Account"
  email     = "testing@example.com"
  parent_id = aws_organizations_organizational_unit.workloads.id

  tags = {
    Environment = "Testing"
    Purpose     = "Testing and QA workloads"
  }
}

resource "aws_organizations_account" "production" {
  name      = "Production Account"
  email     = "production@example.com"
  parent_id = aws_organizations_organizational_unit.workloads.id

  tags = {
    Environment = "Production"
    Purpose     = "Production workloads"
  }
}
