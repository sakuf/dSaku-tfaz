resource "azurerm_virtual_network" "etNET" {
  name                = var.net_name
  address_space       = ["10.0.0.0/16"] # variable?
  location            = var.et_region_primary
  resource_group_name = azurerm_resource_group.etRG.name
}

resource "azurerm_subnet" "etNet-Sub01" {
  name                 = "etNet-internal"
  resource_group_name  = azurerm_resource_group.etRG.name
  virtual_network_name = azurerm_virtual_network.etNET.name
  address_prefixes     = ["10.0.10.0/24"]
}

resource "azurerm_network_interface" "etNet-nic01" {
  name                = "etNet-nic01"
  location            = azurerm_resource_group.etRG.location
  resource_group_name = azurerm_resource_group.etRG.name

  ip_configuration {
    name               = "etNet-internal"
    subnet_id          = azurerm_subnet.etNet-Sub01.id
    private_ip_address_allocation = "Dynamic"
  }
}
