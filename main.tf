module "storage_account_int" {
  source = "./modules/storage-account"

  resource_group_name = var.resource_group_name_storage_account
  location            = var.location

  storage_account_name     = "aavacsintstorage"
  account_tier             = "Standard"
  account_replication_type = "LRS"
  retention_days           = 30

  vnet_subnet_id = var.vnet_subnet_id
  vnet_id        = var.vnet_id
  tags           = var.tags
}
