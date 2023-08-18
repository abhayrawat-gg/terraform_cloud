
data "azurerm_virtual_network" "virtual_network" {
  for_each            = var.private_dns_resolver_variables
  name                = each.value["name"]
  resource_group_name = each.value["resource_group_name"]
}

data "azurerm_subnet" "subnet" {
  for_each             = var.private_dns_resolver_variables
  name                 = each.value["subnet_name"]
  resource_group_name  = each.value["resource_group_name"]
  virtual_network_name = each.value["virtual_network_name"]
}

resource "azurerm_private_dns_resolver" "private_dns_resolver" {
  for_each            = var.private_dns_resolver_variables
  name                = each.value["dns_resolver_name"]
  resource_group_name = each.value["resource_group_name"]
  location            = each.value["location"]
  virtual_network_id  = data.azurerm_virtual_network.virtual_network[each.key].id
}

resource "azurerm_private_dns_resolver_inbound_endpoint" "private_dns_resolver_inbound_endpoint" {
  for_each                = var.private_dns_resolver_variables
  name                    = each.value["inbound_name"]
  private_dns_resolver_id = azurerm_private_dns_resolver.private_dns_resolver[each.key].id
  location                = each.value["inbound_location"]
  ip_configurations {
    subnet_id = data.azurerm_subnet.subnet[each.key].id
  }

}

   