output "storage_account_name" {
    value = azurerm_storage_account.cdn-strg.name
    description = "Name of storage Account"
}

output "cdn_profile_name" {
    value = azurerm_cdn_profile.cdn-profile.name
    description = "Name of CDN profile"
}

output "cdn_resource_group" {
    value = azurerm_cdn_profile.cdn-profile.resource_group_name
    description = "CDN Profile Resource group name"
}

output "cdn_endpoint_name" {
    value = azurerm_cdn_endpoint.static-webpage.name
    description = "CDN endpoint name"
}

