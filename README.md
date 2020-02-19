# Deploys an Azure Virtual Machine Network Interface Card
Creates an Azure Virtual Machine NIC

Reference the module to a specific version (recommended):
```hcl
module "vm_nic" {
    source  = "aztfmod/caf-nic/azurerm"
    version = "~> 1.x.y"
    
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

# Deploys an Azure Virtual Machine Network Interface Card with Public IP address
Creates an Azure Virtual Machine NIC with a Public IP Address


Reference the module to a specific version (recommended):
```hcl
# Creating the public IP address
module "public_ip" {
    source  = "aztfmod/caf-public-ip/azurerm"
    version = "~> 1.x.y"

    # Resource location
    rg                    = azurerm_resource_group.test.name
    location              = azurerm_resource_group.test.location
    tags                  = merge(var.tags, {"test-case" = basename(abspath(path.module))})

    # IP Address details
    name                  = var.public_ip.ip_name
    convention            = var.convention
    ip_addr               = var.public_ip

    # Diagnostics
    diagnostics_map                  = module.diagnostics.diagnostics_map
    log_analytics_workspace_id       = module.log_analytics.object.id
    diagnostics_settings             = var.public_ip.diagnostics_settings
}

module "vm_nic" {
    source  = "aztfmod/caf-nic/azurerm"
    version = "~> 1.x.y"

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
    public_ip_address_id          = module.public_ip.id
}
```

## Inputs

| Name | Type | Default | Description | 
| -- | -- | -- | -- | 
| name | string | None | Specifies the name of the NIC. Changing this forces a new resource to be created. |
| resource_group_name | string | None | The name of the resource group in which to create the VM. Changing this forces a new resource to be created. |
| location | string | None | Specifies the supported Azure location where to create the resource. Changing this forces a new resource to be created.  |
| tags | map | None | Map of tags for the deployment.  | 
| prefix | string | None | Prefix to be used. | 
| convention | string | None | Naming convention (cafrandom) |
| enable_ip_forwarding | boolean | false | Enable IP forwarding |
| internal_dns_name_label | string | null | Internal DNS label name |
| dns_servers | list(string) | External Azure DNS | List of DNS server names or IP addresses |
| enable_accelerated_networking | boolean | false | Enable accelerated vnet. Requires a compatible operating system |
| private_ip_address_allocation | string | "Dynamic" | Set the 'Dynamic' or 'Static' IP allocation |
| private_ip_address | string | null | Set the IP address value |
| private_ip_address_version | string | "IPv4" | Set the IPv4 or IPv6 configuration |
| subnet_id | string | None | Subnet_id to deploy the networking cards | 
| public_ip_address_id | string | None | ID of public ip address | 




## Output

| Name | Type | Description | 
| -- | -- | -- | 
| object | string | Output the networking interface as a full object (azurerm_network_interface.nic) |
| id | string | ID of the nic |
