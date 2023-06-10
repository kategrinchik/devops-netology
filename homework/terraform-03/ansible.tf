resource "local_file" "ansible_inventory" {
  content = templatefile("hosts.tftpl",
    {
       webservers =  yandex_compute_instance.count_VM
       databases = yandex_compute_instance.foreach_VM
       storage = [yandex_compute_instance.storage_VM]
    })
  filename = "inventory"
}