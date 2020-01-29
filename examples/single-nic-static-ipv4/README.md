# Single NIC IPv4 static address

Creates a single NIC with a static IPv4 address

## Usage
To run this example, simply execute: 

```hcl
terraform init
terraform plan
terraform apply
```

Once you are done, just run 
```hcl
terraform destroy
```

## Outputs
| Name | Type | Description | 
| -- | -- | -- | 
| object | string | Output the networking interface as a full object (azurerm_network_interface.nic) |
| id | string | ID of the nic |

## Code example
```hcl
# Required resources to test the module
resource "azurerm_resource_group" "test" {
  name     = "${var.prefix}-${basename(abspath(path.module))}"
  location = var.location
}

resource "azurerm_virtual_network" "test" {
  name                = "acceptanceTestVirtualNetwork1"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.test.location
  resource_group_name = azurerm_resource_group.test.name
}

resource "azurerm_subnet" "test" {
  name                 = "testsubnet"
  resource_group_name  = azurerm_resource_group.test.name
  virtual_network_name = azurerm_virtual_network.test.name
  address_prefix       = "10.0.1.0/24"
}

# Testing the module
module "test_nic" {
  source  = "aztfmod/caf-nic/azurerm"
  version = "~> 0.2.0"

  prefix                = var.prefix
  tags                  = var.tags
  location              = azurerm_resource_group.test.location
  resource_group_name   = azurerm_resource_group.test.name

  name                  = var.name
  convention            = var.convention

  enable_ip_forwarding          = var.enable_ip_forwarding
  internal_dns_name_label       = var.internal_dns_name_label
  dns_servers                   = var.dns_servers
  enable_accelerated_networking = var.enable_accelerated_networking
  private_ip_address_allocation = var.private_ip_address_allocation
  private_ip_address            = var.private_ip_address
  private_ip_address_version    = var.private_ip_address_version

  subnet_id                     = azurerm_subnet.test.id
}
```