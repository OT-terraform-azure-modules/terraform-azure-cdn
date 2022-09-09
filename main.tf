resource "azurerm_storage_account" "cdn-strg" {
  name                     = var.storage_account_names["storage-account-name"]
  resource_group_name      = var.generic_variables["resource-group"]
  location                 = var.generic_variables["location"]
  account_tier             = var.storage_account_names["account-tier"]
  account_replication_type = var.storage_account_names["account-replication-type"]

  static_website {
    index_document = var.storage_account_names["index-document"]
  }
}

resource "azurerm_storage_container" "folder" {
  name                  = var.storage_account_names["container-name"]
  storage_account_name  = azurerm_storage_account.cdn-strg.name
  container_access_type = var.storage_account_names["container-access-type"]
}

resource "azurerm_storage_blob" "indexfile" {
  name                   = var.storage_account_names["blob-name"]
  storage_account_name   = azurerm_storage_container.folder.storage_account_name
  storage_container_name = azurerm_storage_container.folder.name
  type                   = var.storage_account_names["blob-type"]
  content_type           = var.storage_account_names["content-type"]
  source                 = var.storage_account_names["source"]
}

resource "azurerm_cdn_profile" "cdn-profile" {
  name                = var.cdn_variables["profile-name"]
  location            = var.generic_variables["location"]
  resource_group_name = var.generic_variables["resource-group"]
  sku                 = var.cdn_variables["sku"]
}

resource "azurerm_cdn_endpoint" "static-webpage" {
  name                = var.cdn_variables["endpoint-name"]
  profile_name        = var.cdn_variables["profile-name"]
  location            = var.cdn_variables["endpoint-location"]
  resource_group_name = var.generic_variables["resource-group"]

  origin {
    name      = var.cdn_variables["origin-name"]
    host_name = azurerm_storage_account.cdn-strg.primary_blob_host
  }
  origin_host_header = azurerm_storage_account.cdn-strg.primary_blob_host
}