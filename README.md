Azure CDN (content delivery network) Terraform Module
=====================================

[![Opstree Solutions][opstree_avatar]][opstree_homepage]

[Opstree Solutions][opstree_homepage]

  [opstree_homepage]: https://opstree.github.io/
  [opstree_avatar]: https://img.cloudposse.com/150x150/https://github.com/opstree.png

Terraform module which creates cdn profile on Azure .

Terraform versions
------------------
Terraform v0.15.4


Usage
------

```hcl
module "res_group" {
  source                  = "git::https://github.com/OT-terraform-azure-modules/azure_resource_group.git"
  resource_group_name     = "_"
  resource_group_location = "_"
  lock_level_value        = ""
  tag_map = {
    Name = "AzureResourceGroup"
  }
}
module "cdn_profile" {
  source = "https://github.com/OT-terraform-azure-modules/terraform-azure-cdn.git"
  resource_group_name = module.res_group.resource_group_name
  location  = module.res_group.resource_group_location
  storage_account_name = "_"
  storage_container_name = "_"
  storage_blob_name = "_"
  cdn_profile_name = "_"
  cdn_endpoint_name = "_"
}
```

Resources
------
| Name | Type |
|------|------|
| [azurerm_resource_group.rg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |
| [azurerm_cdn_profile](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/cdn_profile) | resource |
| [azurerm_storage_account](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account) | resource |


Inputs
------
| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| resource_group_name | Name of Resource Group | `string` |  | yes |
| resource_group_location | Location where we want to implement code | `string` |  | yes |
| storage_account_name | The name of the storage account. Changing this forces a new resource to be created. | `string` | | yes |
| storage_container_name | conatiner name inside the storage account | `string` | | yes |
| storage_blob_name | blob storage name | `string` | | yes |
| cdn_profile_name | cdn profile name | `string` | | yes |
| cdn_endpoint_name | cdn endpoint name | `string` | | yes |


Output
------
| Name | Description |
|------|-------------|  
| storage_account_name | Name of storage Account |
| cdn_profile_name | Name of CDN profile |
| cdn_resource_group | CDN Profile Resource group name |
| cdn_endpoint_name | CDN endpoint name |


### Contributors

|  [![Anant Chauhan][anant_avatar]][anant_homepage]<br/>[Anant Chauhan][anant_homepage] |
|  [![Vishal][vishal_avatar]][vishal_homepage]<br/>[Vishal][vishal_homepage] |
|---|

  [anant_homepage]: https://gitlab.com/anant.chauhan1
  [anant_avatar]: https://gitlab.com/uploads/-/system/user/avatar/9372704/avatar.png?width=400
  [vishal_avatar]: https://gitlab.com/uploads/-/system/user/avatar/8835802/avatar.png?width=400
  [vishal_homepage]: https://gitlab.com/alfavishal1100