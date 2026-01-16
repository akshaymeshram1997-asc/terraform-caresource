variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "storage_account_name" {
  type = string
}

variable "account_tier" {
  type = string
}

variable "account_replication_type" {
  type = string
}

variable "retention_days" {
  type = number
}

variable "vnet_subnet_id" {
  description = "Subnet ID for Private Endpoint"
  type        = string
}

variable "vnet_id" {
  description = "VNet ID for linking Private DNS Zone"
  type        = string
}

variable "tags" {
  type = map(string)
}

variable "blob_container_name" {
  description = "Name of the blob container"
  type        = string
  default     = "ado"
}


output "blob_container_name" {
  value = azurerm_storage_container.this.name
}

output "blob_container_id" {
  value = azurerm_storage_container.this.id
}

