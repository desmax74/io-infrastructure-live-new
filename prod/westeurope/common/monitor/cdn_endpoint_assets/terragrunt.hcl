dependency "cdn_endpoint_assets" {
  config_path = "../../cdn/cdn_endpoint_assets"
}

dependency "log_analytics_workspace" {
  config_path = "../../log_analytics_workspace"
}

# Include all settings from the root terragrunt.hcl file
include {
  path = find_in_parent_folders()
}

terraform {
  source = "git::git@github.com:pagopa/io-infrastructure-modules-new.git//azurerm_monitor_diagnostic_setting?ref=v2.1.0"
}

inputs = {

  name                       = "cdnendpoint-assets"
  target_resource_id         = dependency.cdn_endpoint_assets.outputs.id
  log_analytics_workspace_id = dependency.log_analytics_workspace.outputs.id

  logs = [{
    category = "CoreAnalytics"
    enabled  = true
    retention_policy = {
      days    = null
      enabled = false
    }
  }]
}
