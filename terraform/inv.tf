resource "local_file" "ansible_inventory" {
  content = templatefile("inventory.tmpl",
  {
    app_content = tomap({
      for key, vm in module.vm_create:
      key => vm.internal_ip_address[0]
      if key != "vm-01" 
  })
    pg_content = tomap({
      for key, vm in module.vm_create:
      key => vm.internal_ip_address02[0]
      if key == "vm-01"
  })

  })
  filename = "../hosts.yaml"
}
