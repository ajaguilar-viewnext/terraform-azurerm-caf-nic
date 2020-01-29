module "caf_name" {
  source  = "aztfmod/caf-naming/azurerm"
  version = "~> 0.1.0"
  
  name        = "${var.prefix}-${var.name}"
  type        = "nic"
  convention  = var.convention

}

resource "azurerm_network_interface" "nic" {

  name                = module.caf_name.nic
  resource_group_name = var.resource_group_name
  location            = var.location


  enable_ip_forwarding          = var.enable_ip_forwarding
  internal_dns_name_label       = var.internal_dns_name_label
  dns_servers                   = var.dns_servers
  enable_accelerated_networking = var.enable_accelerated_networking
  tags                          = local.tags

  ip_configuration {
    name                          = module.caf_name.nic
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = var.private_ip_address_allocation

    # Optional parameters
    private_ip_address         = var.private_ip_address
    private_ip_address_version = var.private_ip_address_version

    public_ip_address_id       = var.public_ip_address_id == null ? null : var.public_ip_address_id
  }
}

