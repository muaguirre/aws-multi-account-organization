# AWS Accounts
# These accounts represent a multi-account AWS Organization structure.

resource "aws_organizations_account" "security" {
  name      = "Security Account"
  email     = "security@${var.account_email_domain}"
  parent_id = aws_organizations_organizational_unit.security.id

  tags = merge(var.common_tags, {
    Environment = "Security"
    Purpose     = "Centralized security monitoring"
  })
}

resource "aws_organizations_account" "log_archive" {
  name      = "Log Archive Account"
  email     = "log-archive@${var.account_email_domain}"
  parent_id = aws_organizations_organizational_unit.security.id

  tags = merge(var.common_tags, {
    Environment = "Security"
    Purpose     = "Centralized logging and audit storage"
  })
}

resource "aws_organizations_account" "shared_services" {
  name      = "Shared Services Account"
  email     = "shared-services@${var.account_email_domain}"
  parent_id = aws_organizations_organizational_unit.infrastructure.id

  tags = merge(var.common_tags, {
    Environment = "Infrastructure"
    Purpose     = "Shared networking and platform services"
  })
}

resource "aws_organizations_account" "development" {
  name      = "Development Account"
  email     = "development@${var.account_email_domain}"
  parent_id = aws_organizations_organizational_unit.development.id

  tags = merge(var.common_tags, {
    Environment = "Development"
    Purpose     = "Development and non-production workloads"
  })
}

resource "aws_organizations_account" "production" {
  name      = "Production Account"
  email     = "production@${var.account_email_domain}"
  parent_id = aws_organizations_organizational_unit.production.id

  tags = merge(var.common_tags, {
    Environment = "Production"
    Purpose     = "Production workloads"
  })
}
