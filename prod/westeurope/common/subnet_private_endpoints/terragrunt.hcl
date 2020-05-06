#  TEMP SUBNET USED WHEN MOVING/RESIZING OTHER APPGATEWAY SUBNETS

# Common
dependency "virtual_network" {
  config_path = "../virtual_network"
}

# Include all settings from the root terragrunt.hcl file
include {
  path = find_in_parent_folders()
}

terraform {
  source = "../../../../../io-infrastructure-modules-new/azurerm_subnet"
}

inputs = {
  name = "pendpoints"

  resource_group_name  = dependency.virtual_network.outputs.resource_group_name
  virtual_network_name = dependency.virtual_network.outputs.resource_name
  address_prefix       = "10.0.250.0/24"

  enforce_private_link_endpoint_network_policies = true

  /*
  delegation = {
    name = "default"

    service_delegation = {
      name    = "Microsoft.Web/serverFarms"
      actions = ["Microsoft.Network/virtualNetworks/subnets/action"]
    }
  }

  service_endpoints = [
    "Microsoft.Web"
  ]
  */
}
