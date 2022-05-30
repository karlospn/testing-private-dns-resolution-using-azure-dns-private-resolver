## Create VNET 
resource "azurerm_virtual_network" "vnet_dns_test" {
    name                = "vnet-${var.project_name}-${var.environment}"
    location            = azurerm_resource_group.rg_dns_test.location
    resource_group_name = azurerm_resource_group.rg_dns_test.name
    address_space       = [var.vnet_cidr]
    tags      = var.default_tags
}
