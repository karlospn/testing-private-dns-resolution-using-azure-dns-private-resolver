variable "project_name" {
    description = "The name of the project"
    type        = string
}

variable "environment" {
    description ="The environment name. Possible values are dev, staging and pro"
    type = string
}

variable "location" {
    description = "Location where the resources are going to be deployed"
    type        = string
}

variable "default_tags" {
  type    = map(string)
  description = "Default tags to be applied"
}

variable "service_plan_public_sku_name"{
    description = "The SKU for the plan. Possible values include B1, B2, B3, D1, F1, FREE, I1, I2, I3, I1v2, I2v2, I3v2, P1v2, P2v2, P3v2, P1v3, P2v3, P3v3, S1, S2, S3, SHARED, EP1, EP2, EP3, WS1, WS2, and WS3."
    type        = string
}

variable "service_plan_private_sku_name"{
    description = "The SKU for the plan. Possible values include B1, B2, B3, D1, F1, FREE, I1, I2, I3, I1v2, I2v2, I3v2, P1v2, P2v2, P3v2, P1v3, P2v3, P3v3, S1, S2, S3, SHARED, EP1, EP2, EP3, WS1, WS2, and WS3."
    type        = string
}

variable "vnet_cidr" {
    description = "The address space that is used for the virtual network."
    type        = string
}

variable "vpn_gw_network_subnet_cidr" {
    description = "The address space that is used for the VPN Gateway subnet."
    type = string
}

variable "public_app_service_vnet_integration_subnet_cidr" {
    description = "The address space that is used for the app service VNET Integration subnet."
    type = string
}

variable "private_endpoints_subnet_cidr" {
    description = "The address space that is used the private endpoints subnet."
    type = string
}

variable "cosmos_mongo_database_throughput" {
    description = "The throughput of the MongoDB database"
    type = number
}

variable "vpn_gw_sku" {
    description = "Configuration of the size and capacity of the virtual network gateway. Valid options are Basic, Standard, HighPerformance, UltraPerformance, ErGw1AZ, ErGw2AZ, ErGw3AZ, VpnGw1, VpnGw2, VpnGw3, VpnGw4,VpnGw5, VpnGw1AZ, VpnGw2AZ, VpnGw3AZ,VpnGw4AZ and VpnGw5AZ and depend on the type, vpn_type and generation arguments. A PolicyBased gateway only supports the Basic sku. Further, the UltraPerformance sku is only supported by an ExpressRoute gateway."
    type = string
}

variable "vpn_gw_client_cidr" {
    description = "The address space out of which ip addresses for vpn clients will be taken."
    type = string
}

variable "vpn_gw_aad_tenant" {
    description = "AzureAD Tenant URL."
    type = string
}

variable "vpn_gw_aad_audience" {
    description = "The client id of the Azure VPN application."
    type = string
}

variable "vpn_gw_aad_issuer" {
    description = "The STS url for your tenant."
    type = string
}