# Storage Account
resource "azurerm_storage_account" "this" {
  name                     = var.storage_account_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type

  min_tls_version                 = "TLS1_2"
  allow_nested_items_to_be_public = false

  blob_properties {
    delete_retention_policy {
      days = var.retention_days
    }
  }

  tags = var.tags
}

# Private Endpoint
resource "azurerm_private_endpoint" "this" {
  name                = "${var.storage_account_name}-pe"
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = var.vnet_subnet_id

  private_service_connection {
    name                           = "${var.storage_account_name}-psc"
    private_connection_resource_id = azurerm_storage_account.this.id
    subresource_names              = ["blob"]
    is_manual_connection           = false
  }

  tags = var.tags
}

# Private DNS Zone for Storage Account Blob
resource "azurerm_private_dns_zone" "blob_zone" {
  name                = "privatelink.blob.core.windows.net"
  resource_group_name = var.resource_group_name
  tags                = var.tags
}

# Link Private DNS Zone to VNet
resource "azurerm_private_dns_zone_virtual_network_link" "pe_link" {
  name                  = "${var.storage_account_name}-dnslink"
  resource_group_name   = var.resource_group_name
  private_dns_zone_name = azurerm_private_dns_zone.blob_zone.name
  virtual_network_id    = var.vnet_id
  registration_enabled  = false
}

# Associate Private Endpoint with DNS Zone
resource "azurerm_private_endpoint_dns_zone_group" "pe_dns" {
  name                = "${var.storage_account_name}-dnsgroup"
  private_endpoint_id = azurerm_private_endpoint.this.id

  private_dns_zone_config {
    name                = "storageaccountdns"
    private_dns_zone_id = azurerm_private_dns_zone.blob_zone.id
  }
}


resource "azurerm_storage_container" "this" {
  name                  = var.blob_container_name
  storage_account_name  = azurerm_storage_account.this.name
  container_access_type = "private"
}
