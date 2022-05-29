terraform {
  required_providers {
    azuredevops = {
      source  = "hashicorp/azurerm"
      version = ">=3.0.0"
    }
  }
}

## Create app service
resource "azurerm_linux_web_app" "mc_app" {
  name                = "app-${var.name}-${var.project_name}-${var.environment}"
  resource_group_name = var.rg_name
  location            = var.rg_location
  service_plan_id     = var.app_service_plan_id
  https_only          = true
  tags                = var.tags 

  site_config {
    always_on = true
    ftps_state = "FtpsOnly"
    vnet_route_all_enabled = var.vnet_route_outbound_traffic
  }

  app_settings = {
    "WEBSITES_ENABLE_APP_SERVICE_STORAGE"   = "false"
  }
  
  identity {
    type = "SystemAssigned"
  }

  logs {
    http_logs {
      file_system {
          retention_in_days = 7
          retention_in_mb = 50
      }
    }
  }
}