###cloud vars
variable "token" {
  type        = string
  description = "OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token"
}

variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network & subnet name"
}

variable "vm_web_family" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "VM image family"
}

variable "vm_web_name" {
  type        = string
  default     = "netology-develop-platform-web"
  description = "VM name"
}

variable "vm_web_platform_id" {
  type        = string
  default     = "standard-v1"
  description = "VM platform ID"
}

variable "vm_web_resources" {
  description = "VM web platform resources"
  type        = map(number)
  default     = { 
    cores = 2, 
    memory = 1, 
    core_fraction = 5
  }
}

#second VM variables

variable "vm_db_name" {
  type        = string
  default     = "netology-develop-platform-db"
  description = "VM name"
}

variable "vm_db_platform_id" {
  type        = string
  default     = "standard-v2"
  description = "VM platform ID"
}

variable "vm_db_resources" {
  description = "VM db platform resources"
  type        = map(number)
  default     = {
    cores = 2,
    memory = 2,
    core_fraction = 20
  }
}

#new block of metadata

variable "vm_metadata" {
  description = "Common metadata for VMs"
#  sensitive   = true
  type        = object({
    serial-port-enable = number
    ssh-keys           = string
})
  default     = { serial-port-enable = 1, ssh-keys = "/здесь интегрирован публичный ключ ssh/" }
}