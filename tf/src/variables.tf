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