resource "azurerm_resource_group" "etRG" {
  name     = var.rg_name
  location = var.et_region_primary

  tags = {
    Environment = var.work_environment
    Team        = var.team_name
  }
}

