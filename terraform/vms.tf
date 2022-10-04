resource "azurerm_linux_virtual_machine" "lighthouse-otv" {
  name                = "lighthouse-of-the-vow"
  resource_group_name = azurerm_resource_group.etRG.name
  location            = azurerm_resource_group.etRG.location
  size                = "Standard_DS1_v2"
  admin_username      = "saku"
  network_interface_ids = [
    azurerm_network_interface.etNet-nic01.id
  ]

  admin_ssh_key {
    username   = "saku"
    public_key = file("~/.ssh/id_dev22908.pub")
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "20.04-LTS"
    version   = "latest"
  }
}

