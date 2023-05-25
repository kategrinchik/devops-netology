locals {
  metadata = {
    ssh-keys           = file("~/.ssh/id_ed25519.pub")
  }
}

locals {
  virtual_machines = [
    { 
      vm_name = "homework03-develop-platform-db-0"
      cpu     = 2
      ram     = 1
      disk    = 10
    },
    {
      vm_name = "homework03-develop-platform-db-1"
      cpu     = 2
      ram     = 2
      disk    = 15
    }  
  ]
} 
