## Create public ip for vpn gateway
resource "azurerm_public_ip" "pip_vpn_gw" {
  name                = "pip-vpn-gw-p2s-${var.project_name}-${var.environment}"
  location            = azurerm_resource_group.rg_dns_test.location
  resource_group_name = azurerm_resource_group.rg_dns_test.name
  allocation_method   = "Dynamic"
  tags                = merge(var.default_tags, { "scope" = "public" })
}