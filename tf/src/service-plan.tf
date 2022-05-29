## Create public service plan
module "plan_public_apps" {
    source                              = "../modules/service_plan"
    name                                = "public-apps"
    rg_name                             = azurerm_resource_group.rg_dns_test.name 
    location                            = azurerm_resource_group.rg_dns_test.location
    project_name                        = var.project_name
    environment                         = var.environment
    os_type                             = "Linux"
    sku_name                            = var.service_plan_public_sku_name
    worker_count                        =  1
    tags                                = merge(var.default_tags, { "scope" = "public" })
}


## Create private service plan
module "plan_private_apps" {
    source                              = "../modules/service_plan"
    name                                = "private-apps"
    rg_name                             = azurerm_resource_group.rg_dns_test.name 
    location                            = azurerm_resource_group.rg_dns_test.location
    project_name                        = var.project_name
    environment                         = var.environment
    os_type                             = "Linux"
    sku_name                            = var.service_plan_private_sku_name
    worker_count                        =  1
    tags                                = merge(var.default_tags, { "scope" = "private" })
}

