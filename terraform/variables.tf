# Terraform Variables

variable "aws_region" {
  description = "AWS region used by the Terraform AWS provider."
  type        = string
  default     = "eu-west-1"
}

variable "approved_regions" {
  description = "List of approved AWS regions where resources can be deployed."
  type        = list(string)
  default = [
    "eu-west-1",
    "eu-west-2",
    "eu-west-3",
    "eu-south-1",
    "eu-central-1"
  ]
}

variable "account_email_domain" {
  description = "Example email domain used for AWS account creation in this portfolio project."
  type        = string
  default     = "example.com"
}

variable "common_tags" {
  description = "Common tags applied to AWS accounts managed by Terraform."
  type        = map(string)
  default = {
    ManagedBy = "Terraform"
    Project   = "AWS Multi-Account Organization"
  }
}
