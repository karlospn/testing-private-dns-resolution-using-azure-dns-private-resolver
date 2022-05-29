terraform {
  required_providers {
    azuredevops = {
      source  = "hashicorp/azurerm"
      version = ">=3.0.0"
    }
    akc = {
      source = "arkiaconsulting/akc"
    }
  }
}

## Create service plan
resource "azurerm_service_plan" "plan_dns_test" {
  name                = "plan-${var.name}-${var.project_name}-${var.environment}"
  resource_group_name = var.rg_name
  location            = var.location
  os_type             = var.os_type
  sku_name            = var.sku_name
  worker_count        = var.worker_count
  tags                = var.tags
}
