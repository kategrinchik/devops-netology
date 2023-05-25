resource "yandex_compute_disk" "my_disk" {
  name = "disk-${count.index}"
  size = 1
  count = 3
}

resource "yandex_compute_instance" "storage_VM" {
  name        = "netology-develop-platform-storage"
  platform_id = "standard-v1"
  resources {
    cores  = 2
    memory = 1
    core_fraction = 5
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu-2004-lts.image_id
      type = "network-hdd"
      size = 5
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

  dynamic "secondary_disk" {
    for_each = [ for disk in yandex_compute_disk.my_disk: disk ]
    content {
      disk_id = yandex_compute_disk.my_disk[secondary_disk.key].id
    }
  }

}#
