provider "azurerm" {
  features {}
}

locals {
  regionList = [
    "westeurope",
    "northeurope",
    "eastus"
  ]

  regions = {
    westeurope  = { code = "weeu", purpose = "sample1" },
    northeurope = { code = "noeu", purpose = "sample2" },
    eastus      = { code = "eaus", purpose = "sample3" }
  }
}

resource "azurerm_resource_group" "rg_demo_module" {
  name     = "rg-demo-module"
  location = "West Europe"
}


module "echo-api" {
  source = "./echo-logic-app"

  environment = {
    location            = "westeurope"
    resource_group_name = azurerm_resource_group.rg_demo_module.name
  }
}
