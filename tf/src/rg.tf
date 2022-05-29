## Create Resource Group
resource "azurerm_resource_group" "rg_dns_test" {
    name      = "rg-${var.project_name}-${var.environment}"
    location  = var.location
    tags      = var.default_tags
}
