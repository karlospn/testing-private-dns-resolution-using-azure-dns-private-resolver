## Create VNET 
resource "azurerm_virtual_network" "vnet_dns_test" {
    name                = "vnet-${var.project_name}-${var.environment}"
    location            = azurerm_resource_group.rg_dns_test.location
    resource_group_name = azurerm_resource_group.rg_dns_test.name
    address_space       = [var.vnet_cidr]
    tags      = var.default_tags
}

## Add Azure Private DNS Resolver Inbound endpoint as VNET DNS Server
resource "azurerm_virtual_network_dns_servers" "vnet_dns_test_dns_servers" {
  virtual_network_id = azurerm_virtual_network.vnet_dns_test.id
  dns_servers        = [jsondecode(azapi_resource.dns_resolver_inbound_endpoint.output).properties.ipConfigurations[0].privateIpAddress]
}