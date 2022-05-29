variable "project_name" {
    description = "The name of the project"
    type        = string
}

variable "environment" {
    description ="The environment name. Possible values are dev and pro"
    type = string
}

variable "name"{
    description = "Application name"
    type        = string
}

variable "rg_name" {
    description = "Resource group name"
    type        = string
}

variable "rg_location" {
    description = "Resource group location"
    type        = string
}

variable "app_service_plan_id" {
    description = "App Service Plan ID where the app is going to be hosted"
    type        = string
}

variable "tags" {
    type        = map(string)
    description = "Tags to be applied"
}

variable "vnet_route_outbound_traffic" {
    description = "Route outbound traffic into a VNET"
    type        = bool
    default     = false
}








