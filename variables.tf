variable "prefix" {

}

variable "tags" {

}

variable "resource_group_name" {
  description = "(Required) Specifies the name of the Resource Group in which the NIC is deployed. Changing this forces a new resource to be created."
}

variable "location" {
  description = "(Required) Specifies the Azure Region where the NIC is deployed. Changing this forces a new resource to be created."
}

variable "nic_objects" {
  description = "(Required) "
}

variable "pip_objects" {
  description = "(Required) "
  default = null
}

variable "subnet_id" {
  description = "(Required) - Subnet_id to deploy the networking cards"
}

variable "pips_id_by_key" {
  description = "(Optional) - Object of public ip IDs by Key"
  default = null
}