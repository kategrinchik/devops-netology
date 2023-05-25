resource "local_file" "ansible_inventory" {
  content = templatefile("hosts.tftpl", {
    webservers          = tolist([
      yandex_compute_instance.count_VM[0], 
      yandex_compute_instance.count_VM[1], 
      yandex_compute_instance.foreach_VM["0"],
      yandex_compute_instance.foreach_VM["1"]
    ])
  })
  filename = "inventory"
}
