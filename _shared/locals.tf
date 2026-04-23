locals {
  common_tags = {
    Project     = var.project_name
    Owner       = "vinic"
    Environment = var.environment
    ManagedBy   = "terraform"
  }
}
