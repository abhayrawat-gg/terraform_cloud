provider "azurerm" {
features{

}  
}

################# rg #####################
module "rg" {
    source = "./modules/resource_group"
    resource_group_variable = var.resource_group_variable
  
}

################### vnet #################

module "vnet" {
    source = "./modules/vnet"
    virtual_network_variables = var.virtual_network_variables
    depends_on = [
      module.rg
    ]
  
}

################## subnet ###################

module "subnet" {
  source = "./modules/subnet"
  subnet_variables = var.subnet_variables
  depends_on = [
    module.vnet,
    module.rg
    
  ]
}

################## nsg #####################

module "nsg" {
    source = "./modules/network_security_group"
    nsg_variables = var.nsg_variables
    depends_on = [
      module.rg
    ]
}

################ inbound rule #############

module "inbound" {
    source = "./modules/inbound_rule"
    inbound_rule_variable = var.inbound_rule_variable
    depends_on = [
      module.nsg
    ]
}

################ outbound rule #############

module "outbound" {
    source = "./modules/outbound_rule"
  outbound_rule_variables = var.outbound_rule_variables
  depends_on = [
    module.nsg
  ]
}

module "private_dns_resolver" {
    source = "./modules/private_dns_resolver"
    private_dns_resolver_variables = var.private_dns_resolver_variables
    depends_on = [
      module.vnet,
      module.subnet
    ]
  
}