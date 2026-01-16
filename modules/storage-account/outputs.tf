output "storage_account_id" {
  value = azurerm_storage_account.this.id
}

output "storage_account_name" {
  value = azurerm_storage_account.this.name
}

output "primary_blob_endpoint" {
  value = azurerm_storage_account.this.primary_blob_endpoint
}

output "private_endpoint_id" {
  value = azurerm_private_endpoint.this.id
}

output "private_dns_zone_id" {
  value = azurerm_private_dns_zone.blob_zone.id
}
