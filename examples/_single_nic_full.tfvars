prefix = "test"

location = "southeastasia"

tags = {
  zone = "public"
}

nic_objects = {
  nics = {
    nic0 = {
      name                          = "nic0"
      private_ip_address_allocation = "Dynamic" # (Required) Defines how a private IP address is assigned. Options are Static or Dynamic.
      # private_ip_address            = ""     # (Optional) Static IP Address
      private_ip_address_version    = "IPv4" # (Optional) The IP Version to use. Possible values are IPv4 or IPv6. 
      enable_ip_forwarding          = false  # (Optional) Enables IP Forwarding on the NIC. Defaults to false.
      internal_dns_name_label       = null   # (Optional) Relative DNS name for this NIC used for internal communications between VMs in the same VNet. When set, must not be null
      enable_accelerated_networking = false  # (Optional) Enables Azure Accelerated Networking using SR-IOV. Only certain VM instance sizes are supported
      dns_servers                   = []     # (Optional) List of DNS servers IP addresses to use for this NIC, overrides the VNet-level server list
      tags                          = {}
    }
  }
}

resource_groups = {
  rg1 = {
    name     = "rg-test-terraform-azurerm-caf-nic_single_full"
    location = "southeastasia"
  },
}