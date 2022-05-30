resource "azapi_resource" "dns_resolver" {
    type      = "Microsoft.Network/dnsResolvers@2020-04-01-preview"
    name      = "resolver-${var.project_name}-${var.environment}"
    parent_id = azurerm_resource_group.rg_dns_test.id
    location  = azurerm_resource_group.rg_dns_test.location
  
    depends_on = [
        azapi_resource.subnet_dns_resolver_inbound_endpoint
    ]

    body =  jsonencode({
        properties = {

            virtualNetwork = {
                id = azurerm_virtual_network.vnet_dns_test.id
            }
        }
    })
    
    tags= var.default_tags
    response_export_values = ["*"]

}

resource "azapi_resource" "dns_resolver_inbound_endpoint" {
    type      = "Microsoft.Network/dnsResolvers/inboundEndpoints@2020-04-01-preview"
    name      = "resolver-inbound-endpoint-${var.project_name}-${var.environment}"
    parent_id = azapi_resource.dns_resolver.id
    location  = azurerm_resource_group.rg_dns_test.location
  
    depends_on = [
        azapi_resource.dns_resolver
    ]

    body =  jsonencode({
        properties = {
            ipConfigurations = [
                {
                    subnet = {
                        id = azapi_resource.subnet_dns_resolver_inbound_endpoint.id
                    },
                    privateIpAllocationMethod = "Dynamic"
                }
            ]
        }
    })
    
    tags= var.default_tags
    response_export_values = ["*"]
}