# AWS Organizations Terraform Example
# This file defines the base structure for a multi-account AWS Organization.

terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "eu-west-1"
}

# Root AWS Organization
resource "aws_organizations_organization" "main" {
  feature_set = "ALL"

  enabled_policy_types = [
    "SERVICE_CONTROL_POLICY"
  ]
}
