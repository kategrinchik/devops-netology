data "yandex_compute_image" "ubuntu-2004-lts" {
  family = "ubuntu-2004-lts" 
}

resource "yandex_compute_instance" "count_VM" {
  name        = "homework03-develop-platform-web-${count.index}"
  platform_id = "standard-v1"
  
  count = 2

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
}#
