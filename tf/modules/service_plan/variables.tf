variable "project_name" {
    description = "The name of the project"
    type        = string
}

variable "environment" {
    description ="The environment name. Possible values are dev,staging and pro"
    type = string
}

variable "name"{
    description = "The name which should be used for this Service Plan. Changing this forces a new AppService to be created."
    type        = string
}

variable "location"{
    description = "The Azure Region where the Service Plan should exist. Changing this forces a new AppService to be created."
    type        = string
}

variable "os_type"{
    description = "The O/S type for the App Services to be hosted in this plan. Possible values include Windows, Linux, and WindowsContainer."
    type        = string
}

variable "sku_name"{
    description = "The SKU for the plan. Possible values include B1, B2, B3, D1, F1, FREE, I1, I2, I3, I1v2, I2v2, I3v2, P1v2, P2v2, P3v2, P1v3, P2v3, P3v3, S1, S2, S3, SHARED, EP1, EP2, EP3, WS1, WS2, and WS3."
    type        = string
}

variable "rg_name"{
    description = "The name of the Resource Group where the AppService should exist. Changing this forces a new AppService to be created."
    type        = string
}

variable "worker_count"{
    description = "The number of Workers (instances) to be allocated."
    type        = number
}

variable "tags" {
    type        = map(string)
    description = "A mapping of tags which should be assigned to the AppService."
}