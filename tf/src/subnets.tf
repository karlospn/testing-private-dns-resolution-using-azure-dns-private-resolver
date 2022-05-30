## Create subnet for VPN Gateway
resource "azurerm_subnet" "subnet_vpn_gw" {
  name                 = "GatewaySubnet"
  resource_group_name  = azurerm_resource_group.rg_dns_test.name
  virtual_network_name = azurerm_virtual_network.vnet_dns_test.name
  address_prefixes     = [var.vpn_gw_network_subnet_cidr]
}

## Create subnet for public app service VNET Integration
resource "azurerm_subnet" "subnet_public_app_svc_vnet_integration" {
  name                 = "SubnetA"
  resource_group_name  = azurerm_resource_group.rg_dns_test.name
  virtual_network_name = azurerm_virtual_network.vnet_dns_test.name
  address_prefixes     = [var.public_app_service_vnet_integration_subnet_cidr]
}

## Create subnet for private endpoints
resource "azurerm_subnet" "subnet_private_endpoints" {
  name                 = "SubnetB"
  resource_group_name  = azurerm_resource_group.rg_dns_test.name
  virtual_network_name = azurerm_virtual_network.vnet_dns_test.name
  address_prefixes     = [var.private_endpoints_subnet_cidr]
}