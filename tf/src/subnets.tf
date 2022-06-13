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
  delegation {
    name = "delegation"
    service_delegation {
      name = "Microsoft.Web/serverFarms"
    }
  }
}

## Create subnet for private endpoints
resource "azurerm_subnet" "subnet_private_endpoints" {
  name                 = "SubnetB"
  resource_group_name  = azurerm_resource_group.rg_dns_test.name
  virtual_network_name = azurerm_virtual_network.vnet_dns_test.name
  address_prefixes     = [var.private_endpoints_subnet_cidr]
  enforce_private_link_endpoint_network_policies = true
}

## Create subnet for the dns privatre resolver inbound endpoint
resource "azapi_resource" "subnet_dns_resolver_inbound_endpoint" {
    type      = "Microsoft.Network/virtualNetworks/subnets@2020-11-01"
    name      = "SubnetC"
    parent_id = azurerm_virtual_network.vnet_dns_test.id
  
    depends_on = [
        azurerm_virtual_network.vnet_dns_test
    ]

    body =  jsonencode({
        properties = {
          addressPrefix = var.dns_resolver_inbound_endpoint_subnet_cidr
          serviceEndpoints = []
          privateEndpointNetworkPolicies = "Enabled"
          privateLinkServiceNetworkPolicies = "Enabled"
          delegations = [
            {
                name = "delegation"
                properties = {
                    serviceName = "Microsoft.Network/dnsResolvers"
                }
            }
          ]
        }
    })
    
    response_export_values = ["*"]
}