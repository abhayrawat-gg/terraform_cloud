variable "outbound_rule_variables" {
  type = map(object({

    name                       = string
    priority                   = number
    direction                  = string
    access                     = string
    protocol                   = string
    outbound_source_port_range = string
    outbound_destination_port_range = number
    outbound_source_address_prefix=string
    outbound_destination_address_prefix = string
    resource_group_name         = string
    network_security_group_name = string

  }))

}