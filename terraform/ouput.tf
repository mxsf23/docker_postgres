output "internal_ip_address" {
  value = { for vm_key, vm_value in ("${module.vm_create}") :
    vm_key => vm_key == "vm-01" ? "${module.vm_create[vm_key].internal_ip_address02}" :"${module.vm_create[vm_key].internal_ip_address}"   
  }
  description = "Virtual machine intrernal IP-address"
}

output "external_ip_address" {
  value = { for vm_key, vm_value in ("${module.vm_create}") :
    vm_key => vm_key == "vm-01" ? "${module.vm_create[vm_key].external_ip_address02}" :"${module.vm_create[vm_key].external_ip_address}"   
  }
  description = "Virtual machine extrernal IP-address"
}


output "hostnames" {
  value = { for vm_key, vm_value in ("${module.vm_create}"):
    vm_key => vm_value 
    # vm_key == "vm-runner" ? vm_value.vm_hostname02[0] : vm_value.vm_hostname[0]
  } 
}
