resource "yandex_compute_instance" "foreach_VM" {
  for_each   = {
    for index, vm in local.virtual_machines:
    index => vm
  }
  name       = each.value.vm_name
  depends_on = [
    yandex_compute_instance.count_VM,
  ]
  platform_id = "standard-v1"

  resources {
    cores  = 2
    memory = each.value.ram
    core_fraction = 20
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu-2004-lts.image_id
      type = "network-hdd"
      size = each.value.disk
    }
  }
  
  metadata = {
    ssh-keys = "ubuntu:${local.metadata.ssh-keys}"
  }
  
  scheduling_policy { preemptible = true }
  
  network_interface { 
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
  }
  allow_stopping_for_update = true
}#
