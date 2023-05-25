output "netology-develop-platform-web" {
  value = yandex_compute_instance.platform.network_interface.0.nat_ip_address
  description = "VM web external ip"
}

output "netology-develop-platform-db" {
  value = yandex_compute_instance.platform2.network_interface.0.nat_ip_address
  description = "VM db external ip"
}
