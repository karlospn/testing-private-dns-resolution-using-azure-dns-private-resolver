variable "rg_name" {
    description = "Specifies the Name of the Resource Group within which the Private Endpoint should exist. Changing this forces a new resource to be created."
    type        = string
}

variable "rg_location" {
    description = "Specifies the Name of the Private Endpoint. Changing this forces a new resource to be created."
    type        = string
}

variable "private_endpoint_name" {
    description = "Specifies the Name of the Private Endpoint. Changing this forces a new resource to be created."
    type        = string
}

variable "subnet_id" {
    description = "The ID of the Subnet from which Private IP Addresses will be allocated for this Private Endpoint. Changing this forces a new resource to be created."
    type        = string
}

variable "private_dns_zone_ids" {
    description = "Specifies the list of Private DNS Zones to include within the private_dns_zone_group"
    type        = list(string)
}

variable "private_connection_resource_id" {
    description = "The ID of the Private Link Enabled Remote Resource which this Private Endpoint should be connected to"
    type        = string
}

variable "subresource_names" {
    description = "A list of subresource names which the Private Endpoint is able to connect to"
    type        = list(string)
}

variable "tags" {
    type        = map(string)
    description = "Tags to be applied"
}