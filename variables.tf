variable "resource_group_name_storage_account" {
  type    = string
  default = "rg-aava-storage-eastus-int-01"
}

variable "location" {
  type    = string
  default = "eastus"
}

variable "vnet_subnet_id" {
  description = "Subnet ID where Private Endpoint will be deployed"
  default     = "/subscriptions/941b73f2-a762-4b60-a6d0-58e7a3b84f09/resourceGroups/Infrastructure_RG/providers/Microsoft.Network/virtualNetworks/int-eastus-eqe-vnet1/subnets/storage-subnet"
}

variable "vnet_id" {
  description = "VNet ID for linking Private DNS Zone"
  default     = "/subscriptions/941b73f2-a762-4b60-a6d0-58e7a3b84f09/resourceGroups/Infrastructure_RG/providers/Microsoft.Network/virtualNetworks/int-eastus-eqe-vnet1"
}

variable "tags" {
  type = map(string)
  default = {
    Environment = "Integration"
    ManagedBy   = "Terraform"
    Project     = "Aava"
  }
}
