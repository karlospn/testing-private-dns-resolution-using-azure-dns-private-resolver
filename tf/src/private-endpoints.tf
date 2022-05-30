## Create private endpoint for private app service
module "private_api_app_service_private_endpoint" {
    source                              = "../modules/private_endpoint"
    private_endpoint_name               = "private-api"
    rg_name                             = azurerm_resource_group.rg_dns_test.name 
    rg_location                         = azurerm_resource_group.rg_dns_test.location
    subnet_id                           = azurerm_subnet.subnet_private_endpoints.id
    private_dns_zone_ids                = [azurerm_private_dns_zone.dns_app_service.id]
    private_connection_resource_id      = module.app_service_private_api.linux_app_service_id
    subresource_names                   = ["sites"]
    tags                                = merge(var.default_tags, { "scope" = "private" })
}


## Create private endpoint for cosmosdb
module "cosmos_private_endpoint" {
    source                              = "../modules/private_endpoint"
    private_endpoint_name               = "cosmos-database"
    rg_name                             = azurerm_resource_group.rg_dns_test.name 
    rg_location                         = azurerm_resource_group.rg_dns_test.location
    subnet_id                           = azurerm_subnet.subnet_private_endpoints.id
    private_dns_zone_ids                = [azurerm_private_dns_zone.dns_cosmos_mongo.id]
    private_connection_resource_id      = azurerm_cosmosdb_account.cosmos_dns_test.id
    subresource_names                   = ["MongoDb"]
    tags                                = merge(var.default_tags, { "scope" = "private" })
}