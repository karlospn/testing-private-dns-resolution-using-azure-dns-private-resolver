terraform {
  required_providers {
    azuredevops = {
      source  = "hashicorp/azurerm"
      version = ">=3.0.0"
    }
  }
}

## Create private endpoint
resource "azurerm_private_endpoint" "private_endpoint_dns_test" {
  name                = "private-endpoint-${var.private_endpoint_name}-${var.project_name}-${var.environment}"
  location            = var.rg_location
  resource_group_name = var.rg_name
  subnet_id           = var.subnet_id

  private_dns_zone_group {
    name = "privatednszonegroup"
    private_dns_zone_ids = var.private_dns_zone_ids
  }

  private_service_connection {
    name = "privateendpointconnection"
    private_connection_resource_id = var.private_connection_resource_id
    subresource_names = var.subresource_names
    is_manual_connection = false
  }
  
  tags = var.tags
}

