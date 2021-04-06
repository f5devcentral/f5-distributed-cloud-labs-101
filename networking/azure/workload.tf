# Create public IPs
resource "azurerm_public_ip" "workload" {
  name                = "workload_pip"
  resource_group_name = var.resource_group
  location            = var.location
  allocation_method   = "Dynamic"
  depends_on          = [azurerm_resource_group.rg]
}

# Create NIC
resource "azurerm_network_interface" "workload" {
  name                = "workload-nic"
  resource_group_name = var.resource_group
  location            = var.location

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.workload.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.workload.id
  }
}
# Create virtual machine
resource "azurerm_linux_virtual_machine" "workload" {
  name                = "workload"
  resource_group_name = var.resource_group
  location            = var.location
  size                = "Standard_DS1_v2"

  network_interface_ids = [azurerm_network_interface.workload.id]

  os_disk {
    name                 = "workload"
    caching              = "ReadWrite"
    storage_account_type = "Premium_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  computer_name                   = "workload"
  admin_username                  = "azureuser"
  disable_password_authentication = true

  custom_data = "IyEvYmluL2Jhc2gNCnNsZWVwIDMwDQpzbmFwIGluc3RhbGwgZG9ja2VyDQpzeXN0ZW1jdGwgZW5hYmxlIHNuYXAuZG9ja2VyLmRvY2tlcmQNCnN5c3RlbWN0bCBzdGFydCBzbmFwLmRvY2tlci5kb2NrZXJkDQpzbGVlcCAzMA0KZG9ja2VyIHJ1biAtZCAtLW5ldD1ob3N0IC0tcmVzdGFydD1hbHdheXMgXA0KICAgIC1lIEY1REVNT19BUFA9dGV4dCBcDQogICAgLWUgRjVERU1PX05PREVOQU1FPWIAGEF6dXJlIEVudmlyb25tZW50JyBcDQogICAgLWUgRjVERU1PX0NPTE9SPWZmZDczNCBcDQogICAgLWUgRjVERU1PX05PREVOQU1FX1NTTD1iABhBenVyZSBFbnZpcm9ubWVudCAoQmFja2VuZCBBcHApJyBcDQogICAgLWUgRjVERU1PX0NPTE9SX1NTTD1hMGJmMzcgXA0KICAgIHB1YmxpYy5lY3IuYXdzL3k5bjJ5NXE1L2RlbW9zOm9wZW5zaGlmdA=="

  admin_ssh_key {
    username   = "azureuser"
    public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEAnh++9dEp5oB3yCtdXwxTOuxuwALjTIpXOuLy7msA+RA7RYsJ6MYJJdEnV0sNXWCLJphxukUIldVHmrXM5qoYwV6PBAGyD1VjhPAQ4UR0eOGD0ar7J2vMz0PEve9UUSiVBjEZeKbMQtvmAMNH0sy1nUE/QTNdHf0k96shoAN4l6AITF1U8UgXdvDUBvIXTJ1IVMjKARkGflZiFIpHHrprhBJjz5sPZ80/yhsHUdZIKt+qsaI8zvbxnpqSEvFsjWVV9rPoXblnKIUC7DJsO42f8G63UbCLVW7gGfUINjqRy/cO1q1qDOHDZdzpDQHZFOfQmvQDNkgL2id4UHOhl5q/Aw=="
  }
}