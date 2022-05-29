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


## Create private api app service
module "app_service_public_api" {
    source                              = "..//modules/linux_app_service"
    name                                = "pprivate-api"
    rg_name                             = azurerm_resource_group.rg_dns_test.name 
    rg_location                         = azurerm_resource_group.rg_dns_test.location
    project_name                        = var.project_name
    environment                         = var.environment
    app_service_plan_id                 = module.plan_private_apps.service_plan_id
    vnet_route_outbound_traffic         = false
    tags                                = merge(var.default_tags, { "scope" = "private" })
}