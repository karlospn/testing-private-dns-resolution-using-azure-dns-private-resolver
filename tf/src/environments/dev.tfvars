## See variables.tf for descriptions

project_name = "dns-resolver-test"
environment = "dev"
location = "West Europe"
default_tags = {
    "region" = "west europe"
    "environment" = "dev"
    "business-unit" = "It"
    "project-name": "dns-resolver-test"
    "owner-name": "carlos@mytechramblings.com"
    "technical-contact" : "carlos@mytechramblings.com"
    "active-period" : "24/7"
    "customer" : "blog-post"
    "priority" : "0"
} 
service_plan_public_sku_name = "B2"
service_plan_private_sku_name = "B2"
vnet_cidr ="10.18.0.0/16"
vpn_gw_network_subnet_cidr = "10.18.254.0/27"
public_app_service_vnet_integration_subnet_cidr = "10.18.1.0/24"
private_endpoints_subnet_cidr = "10.18.2.0/24"