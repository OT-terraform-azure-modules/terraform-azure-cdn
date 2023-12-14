variable "generic_variables" {
  description = "comman variables"
  type        = map(string)
  default = {
    "resource-group" = "anant_rg"
    "location"       = "eastus"
  }
}

variable "storage_account_names" {
  description = "storage account's components names"
  type        = map(string)
  default = {
    "storage-account-name"     = "anantcdnstrg1100"
    "account-tier"             = "Standard"
    "account-replication-type" = "GRS"
    "container-name"           = "folder"
    "container-access-type"    = "container"
    "blob-name"                = "index.html"
    "blob-type"                = "Block"
    "content-type"             = "text/html"
    "source"                   = "index.html"
    "index-document"           = "index.html"
  }
}

variable "cdn_variables" {
  description = "variables of cdn objects"
  type        = map(string)
  default = {
    "profile-name"      = "cdnprofile"
    "sku"               = "Standard_Microsoft"
    "endpoint-name"     = "static-webpage"
    "origin-name"       = "static-web-page"
    "endpoint-location" = "global"
  }
}