## Create private dns zone for app service
resource "azurerm_private_dns_zone" "dns_app_service" {
  name                = "privatelink.azurewebsites.net"
  resource_group_name = azurerm_resource_group.rg_dns_test.name
}

## Link app service private dns zone to VNET
resource "azurerm_private_dns_zone_virtual_network_link" "link_dns_app_service" {
  name = "app-svc-zone-link"
  resource_group_name = azurerm_resource_group.rg_dns_test.name
  private_dns_zone_name = azurerm_private_dns_zone.dns_app_service.name
  virtual_network_id = azurerm_virtual_network.vnet_dns_test.id
}


## Create private dns zone for cosmos
resource "azurerm_private_dns_zone" "dns_cosmos_mongo" {
  name                = "privatelink.mongo.cosmos.azure.com"
  resource_group_name = azurerm_resource_group.rg_dns_test.name
}

## Link cosmos private dns zone to VNET
resource "azurerm_private_dns_zone_virtual_network_link" "link_dns_cosmos_mongo" {
  name = "cosmos-zone-link"
  resource_group_name = azurerm_resource_group.rg_dns_test.name
  private_dns_zone_name = azurerm_private_dns_zone.dns_cosmos_mongo.name
  virtual_network_id = azurerm_virtual_network.vnet_dns_test.id
}
## End Create private DNS zone for app services Block