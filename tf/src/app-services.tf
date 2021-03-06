## Create public api app service
module "app_service_public_api" {
    source                              = "..//modules/linux_app_service"
    name                                = "public-api"
    rg_name                             = azurerm_resource_group.rg_dns_test.name 
    rg_location                         = azurerm_resource_group.rg_dns_test.location
    project_name                        = var.project_name
    environment                         = var.environment
    app_service_plan_id                 = module.plan_public_apps.service_plan_id
    vnet_route_outbound_traffic         = true
    tags                                = merge(var.default_tags, { "scope" = "public" })
}

## Create VNET Integration for public api app service
resource "azurerm_app_service_virtual_network_swift_connection" "public_api_vnet_integration_connection" {
  app_service_id  = module.app_service_public_api.linux_app_service_id
  subnet_id       = azurerm_subnet.subnet_public_app_svc_vnet_integration.id
}

## Create private api app service
module "app_service_private_api" {
    source                              = "..//modules/linux_app_service"
    name                                = "private-api"
    rg_name                             = azurerm_resource_group.rg_dns_test.name 
    rg_location                         = azurerm_resource_group.rg_dns_test.location
    project_name                        = var.project_name
    environment                         = var.environment
    app_service_plan_id                 = module.plan_private_apps.service_plan_id
    vnet_route_outbound_traffic         = false
    tags                                = merge(var.default_tags, { "scope" = "private" })
}