output "storage_account_id" {
  value = module.storage_account_int.storage_account_id
}

output "storage_account_name" {
  value = module.storage_account_int.storage_account_name
}

output "storage_account_primary_blob_endpoint" {
  value = module.storage_account_int.primary_blob_endpoint
}

output "storage_account_private_endpoint_id" {
  value = module.storage_account_int.private_endpoint_id
}

output "storage_account_private_dns_zone_id" {
  value = module.storage_account_int.private_dns_zone_id
}
