variable "prefix" {
  description = "Resource prefix"
  default = "test"
}

variable "location" {
  description = "Location of the resources"
  default = "southeastasia"
}

variable "tags" {
  default = {
  }
}

variable "convention" {
  default = "cafrandom"
}


variable "name" {
  description = "Name of the networking card"
  default = "caftest-"
}

variable "enable_ip_forwarding" {
  description = "(Optional) (Default = false) enable ip forwarding"
  default = false
}

variable "internal_dns_name_label" {
  default = null
}

variable "dns_servers" {
  description = "(Optional) List of DNS server to apply to the NIC"
  default = []
}

variable "enable_accelerated_networking" {
  description = "(Optional) (Default = false) enable accelerated networking to reduce latency and improve throughput. Requires compatible operating system"
  default = false
}

variable "private_ip_address_allocation" {
  description = "(Optional) (Default = 'Dynamic'). When set to static must also set a value for private_ip_address"
  default = "Dynamic"
}

variable "private_ip_address" {
  description = "(Optional) IP address of the NIC when private_ip_address_allocation is set to 'Static'"
  default = null
}

variable "private_ip_address_version" {
  description = "(Optional) (Default = 'ipIPv4v4') Possible values are 'IPv4' and 'IPv6'"
  default = "IPv4"
}

variable "public_ip_address_id" {
  description = "(Optional) Public IP address ID "
  default = null
}

variable "public_ip" {
  description = "Object as defined in the default"
  default = {
    ip_name = "pip"    
    allocation_method   = "Static"
    #Dynamic Public IP Addresses aren't allocated until they're assigned to a resource (such as a Virtual Machine or a Load Balancer) by design within Azure 
    
    #properties below are optional 
    sku                 = "Standard"                        #defaults to Basic
    ip_version          = "IPv4"                            #defaults to IP4, Only dynamic for IPv6, Supported arguments are IPv4 or IPv6, NOT Both

    diagnostics_settings = {
        log = [
            #["Category name",  "Diagnostics Enabled(true/false)", "Retention Enabled(true/false)", Retention_period] 
            ["DDoSProtectionNotifications", true, true, 30],
            ["DDoSMitigationFlowLogs", true, true, 30],
            ["DDoSMitigationReports", true, true, 30],
            ]
        metric = [
                ["AllMetrics", true, true, 30],
        ]
    }
  }
}