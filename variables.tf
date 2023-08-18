variable "resource_group_variable" {
  type = map(object({
    name     = string
    location = string
  }))

}

##############  vnet ################

variable "virtual_network_variables" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    address_space       = list(string)

  }))
  default = {

  }
}

################## subnet ###################

variable "subnet_variables" {

  type = map(object({
    name                 = string
    resource_group_name  = string
    virtual_network_name = string
    address_prefixes     = list(string)
  }))
  default = {

  }
}
################### nsg ###################

variable "nsg_variables" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
  }))
  default = {
  }
}

################# inbound ##################
variable "inbound_rule_variable" {
  type = map(object({
    name                      = string
    priority                  = number
    direction                 = string
    access                    = string
    protocol                  = string
    inbound_source_port_range = string

    inbound_destination_port_range = number

    inbound_source_address_prefix = string

    inbound_destination_address_prefix = string
    resource_group_name                = string
    network_security_group_name        = string
  }))
  default = {
  }
}


################# outbound ##################

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
################dns resolver################

variable "private_dns_resolver_variables" {
  type = map(object({
    name                = string
    resource_group_name = string
    dns_resolver_name   = string
    location            = string
    subnet_name         = string
    inbound_name        = string
    inbound_location    = string
    virtual_network_name=string

  }))
  default = {
  }
}