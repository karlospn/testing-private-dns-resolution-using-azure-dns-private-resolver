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