## Create cosmos mongo database
resource "azurerm_cosmosdb_account" "cosmos_dns_test" {
    name                            = "cosmos-${var.project_name}-${var.environment}"
    location                        = azurerm_resource_group.rg_dns_test.location
    resource_group_name             = azurerm_resource_group.rg_dns_test.name
    offer_type                      = "Standard"
    kind                            = "MongoDB"
    mongo_server_version            = "4.2"
    public_network_access_enabled   = false
    enable_automatic_failover       = true
    enable_multiple_write_locations = false
    enable_free_tier                = false
    ip_range_filter                 = "104.42.195.92,40.76.54.131,52.176.6.30,52.169.50.45,52.187.184.26"
    tags                            = merge(var.default_tags, { "scope" = "private" })
    
    capabilities {
        name = "EnableAggregationPipeline"
    }

    capabilities {
        name = "mongoEnableDocLevelTTL"
    }

    capabilities {
        name = "MongoDBv3.4"
    }

    capabilities {
        name = "EnableMongo"
    }

    capabilities {
        name = "DisableRateLimitingResponses"
    }

    consistency_policy {
        consistency_level = "Session"
    }

    geo_location {
        location  = azurerm_resource_group.rg_dns_test.location
        failover_priority = 0
    }
}

resource "azurerm_cosmosdb_mongo_database" "cosmos_database" {
    name                = "demo"
    resource_group_name = azurerm_resource_group.rg_dns_test.name
    account_name        = azurerm_cosmosdb_account.cosmos_dns_test.name
    throughput          = var.cosmos_mongo_database_throughput
}
