# DNS Zone
dependency "resource_group" {
  config_path = "../../resource_group"
}

# Include all settings from the root terragrunt.hcl file
include {
  path = find_in_parent_folders()
}

terraform {
  source = "git::git@github.com:pagopa/io-infrastructure-modules-new.git//azurerm_private_dns_zone?ref=v2.1.11"
}

inputs = {
  name                = "privatelink.postgres.database.azure.com"
  resource_group_name = dependency.resource_group.outputs.resource_name
}
