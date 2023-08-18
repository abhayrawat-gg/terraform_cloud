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