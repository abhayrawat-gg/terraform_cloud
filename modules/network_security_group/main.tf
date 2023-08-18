resource "azurerm_network_security_group" "network_security_group" {
  for_each            = var.nsg_variables
  name                = each.value["name"]
  location            = each.value["location"]
  resource_group_name = each.value["resource_group_name"]

}