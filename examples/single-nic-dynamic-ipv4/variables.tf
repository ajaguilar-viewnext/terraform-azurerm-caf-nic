variable "prefix" {
  description = "Resource prefix"
  default = "test"
}


variable "location" {
  description = "Location of the resources"
  default = "southeastasia"
}

variable "tags" {
  default = {}
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
  default = ["1.2.3.4"]
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
  description = "(Optional) (Default = 'IPv4') Possible values are 'IPv4' and 'IPv6'"
  default = "IPv4"
}

variable "public_ip_address_id" {
  description = "(Optional) Public IP address ID "
  default = null
}