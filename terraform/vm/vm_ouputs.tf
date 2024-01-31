output "internal_ip_address" {
  value = yandex_compute_instance.vm-01[*].network_interface.0.ip_address
}

output "external_ip_address" {
  value = yandex_compute_instance.vm-01[*].network_interface.0.nat_ip_address
}

output "internal_ip_address02" {
  value = yandex_compute_instance.vm-02[*].network_interface.0.ip_address
}

output "external_ip_address02" {
  value = yandex_compute_instance.vm-02[*].network_interface.0.nat_ip_address
}

output "vm_hostname" {
  value = yandex_compute_instance.vm-01[*].hostname
}

output "vm_hostname02" {
  value = yandex_compute_instance.vm-02[*].hostname
}
