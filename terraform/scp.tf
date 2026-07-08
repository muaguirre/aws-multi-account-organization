# Service Control Policies
# These SCPs define preventive governance controls for the AWS Organization.

resource "aws_organizations_policy" "deny_root_user" {
  name        = "DenyRootUserActions"
  description = "Deny actions performed by the AWS root user."
  type        = "SERVICE_CONTROL_POLICY"

  content = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid      = "DenyRootUserActions"
        Effect   = "Deny"
        Action   = "*"
        Resource = "*"
        Condition = {
          StringLike = {
            "aws:PrincipalArn" = [
              "arn:aws:iam::*:root"
            ]
          }
        }
      }
    ]
  })
}

resource "aws_organizations_policy" "restrict_regions" {
  name        = "RestrictRegionsOutsideEurope"
  description = "Deny AWS actions outside approved European regions."
  type        = "SERVICE_CONTROL_POLICY"

  content = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid    = "DenyRegionsOutsideEurope"
        Effect = "Deny"
        NotAction = [
          "iam:*",
          "organizations:*",
          "route53:*",
          "cloudfront:*",
          "support:*",
          "billing:*"
        ]
        Resource = "*"
        Condition = {
          StringNotEquals = {
            "aws:RequestedRegion" = var.approved_regions
          }
        }
      }
    ]
  })
}

# Attach deny root user SCP to all main Organizational Units

resource "aws_organizations_policy_attachment" "deny_root_user_security" {
  policy_id = aws_organizations_policy.deny_root_user.id
  target_id = aws_organizations_organizational_unit.security.id
}

resource "aws_organizations_policy_attachment" "deny_root_user_infrastructure" {
  policy_id = aws_organizations_policy.deny_root_user.id
  target_id = aws_organizations_organizational_unit.infrastructure.id
}

resource "aws_organizations_policy_attachment" "deny_root_user_development" {
  policy_id = aws_organizations_policy.deny_root_user.id
  target_id = aws_organizations_organizational_unit.development.id
}

resource "aws_organizations_policy_attachment" "deny_root_user_production" {
  policy_id = aws_organizations_policy.deny_root_user.id
  target_id = aws_organizations_organizational_unit.production.id
}

# Attach region restriction SCP to workload-related Organizational Units

resource "aws_organizations_policy_attachment" "restrict_regions_development" {
  policy_id = aws_organizations_policy.restrict_regions.id
  target_id = aws_organizations_organizational_unit.development.id
}

resource "aws_organizations_policy_attachment" "restrict_regions_production" {
  policy_id = aws_organizations_policy.restrict_regions.id
  target_id = aws_organizations_organizational_unit.production.id
}
