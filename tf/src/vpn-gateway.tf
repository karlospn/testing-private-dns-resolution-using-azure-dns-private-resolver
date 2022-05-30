## Create VPN gateway
resource "azurerm_virtual_network_gateway" "vpn_gw_p2s" {
  name                = "vpn-gw-p2s-${var.project_name}-${var.environment}"
  location            = azurerm_resource_group.rg_dns_test.location
  resource_group_name = azurerm_resource_group.rg_dns_test.name
  type     = "Vpn"
  vpn_type = "RouteBased"

  active_active = false
  enable_bgp    = false
  sku           = var.vpn_gw_sku
  tags          = var.default_tags

  ip_configuration {
    name                          = "vnetGatewayConfig"
    public_ip_address_id          = azurerm_public_ip.pip_vpn_gw.id
    private_ip_address_allocation = "Dynamic"
    subnet_id                     = azurerm_subnet.subnet_vpn_gw.id
  }

  vpn_client_configuration {
    address_space         = [var.vpn_gw_client_cidr]
    vpn_auth_types        = ["AAD"]
    aad_tenant            = "https://login.microsoftonline.com/${var.vpn_gw_aad_tenant}/"
    aad_audience          = var.vpn_gw_aad_audience
    aad_issuer            = "https://sts.windows.net/${var.vpn_gw_aad_tenant}"
  }
}