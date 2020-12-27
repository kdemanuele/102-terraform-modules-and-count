resource "azurerm_resource_group" "rg_demo_foreach" {
  name     = "rg-demo-foreach"
  location = "West Europe"
}

resource "azurerm_storage_account" "demo_datalake_foreach" {
  for_each                 = local.regions
  name                     = "dls${each.value.purpose}${each.value.code}001"
  resource_group_name      = azurerm_resource_group.rg_demo_foreach.name
  location                 = each.key
  account_tier             = "Standard"
  account_replication_type = "LRS"
  account_kind             = "StorageV2"
  is_hns_enabled           = "true"
}
