module "vm_create" {
  source = "./vm"
  cloud_id  = var.cloud_id
  folder_id = var.folder_id
  zone      = var.zone
  sa_id     = var.sa_id

  subnet_id = "${module.network.subnet_id}"
  network_id = "${module.network.network_id}"
  ssh_keys = "ubuntu:${file("../../b48/sftest.pub")}" // Path to ssh-key file
  user_data = "${file("../../b48/user-data.yaml")}" // Path to cloud-init config
  priv_key = "${file("../../b48/sftest")}"

  providers = {
    yandex.primary = yandex
  }
  for_each = local.vms
  name = each.key
  hostname = each.value.hostname
  image_id = each.value.image_id
}

module "network" {
  source = "./network"
  cloud_id  = var.cloud_id
  folder_id = var.folder_id
  zone      = var.zone
  sa_id     = var.sa_id
  network_name = var.network_name
  subnet_name = var.subnet_name
  v4_cidr_blocks = var.v4_cidr_blocks
  # subnet_id = yandex_vpc_subnet.subnet-1.id
  # network_id = yandex_vpc_network.network-1.id

  providers = {
    yandex.primary = yandex
  }
}
