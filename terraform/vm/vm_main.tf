resource "yandex_compute_instance" "vm-01" {
  name = var.name
  hostname = var.hostname
  count = var.hostname == "vm-01" ? 0 : 1

  resources {
    cores  = 2
    memory = 2
    core_fraction = 5
  }

  boot_disk {
    initialize_params {
      image_id = var.image_id
      size = 20
      type = "network-hdd"
    }
  }

  network_interface {
    subnet_id = var.subnet_id
    nat       = true
  }

  scheduling_policy {
    preemptible = true
  }

  metadata = {
    ssh-keys = var.ssh_keys
    user-data = var.user_data
  }
 
}

resource "yandex_compute_instance" "vm-02" {
  name = var.name
  hostname = var.hostname
  count = var.hostname == "vm-01" ? 1 : 0

  resources {
    cores  = 2
    memory = 2
    core_fraction = 5
  }

  boot_disk {
    initialize_params {
      image_id = var.image_id
      size = 20
      type = "network-hdd"
    }
  }

  network_interface {
    subnet_id = var.subnet_id
    nat       = true
  }

  scheduling_policy {
    preemptible = true
  }

  metadata = {
    ssh-keys = var.ssh_keys
    user-data = var.user_data
  }
  
  provisioner "remote-exec" {
  inline = [
    "sudo apt-get update -y",
    "sudo apt-get install python3 ansible -y",
    ]
  connection {
    host        = self.network_interface.0.nat_ip_address
    type        = "ssh"
    user        = "ansible"
    private_key = var.priv_key
  }    
 }
}



# resource "terraform_data" "ya_ansible_instance" {
#   for_each = {
#      for k, v in yandex_compute_instance.vm-01 : k => v
#     if yandex_compute_instance.vm-01.hostname == "vm-runner"
#    }
  
#   provisioner "remote-exec" {
#     inline = [
#       "sudo apt-get update -y",
#       "sudo apt-get install python3 ansible -y",
#       ]
#     connection {
#       host        = self.network_interface.0.nat_ip_address
#       type        = "ssh"
#       user        = "mvadmin"
#       private_key = var.priv_key
#     }    
#   }
# }


