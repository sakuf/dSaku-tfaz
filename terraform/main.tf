terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.2"
    }
  }

  cloud {
    organization = "sakuffoio"
    workspaces {
      name = "dSaku-tfaz"
    }
  }

  required_version = ">= 1.1.0"
}

provider "azurerm" {
  features {
  }
}


resource "azurerm_resource_group" "etRG" {
  name     = var.rg_name
  location = var.et_region_primary

  tags = {
    Environment = var.work_environment
    Team        = var.team_name
  }
}

resource "azurerm_virtual_network" "etDNET" {
  name                = var.net_name
  address_space       = ["10.0.0.0/16"] # variable?
  location            = var.et_region_primary
  resource_group_name = azurerm_resource_group.etRG.name
}
