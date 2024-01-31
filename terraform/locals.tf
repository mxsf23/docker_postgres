data "yandex_compute_image" "image01" {
  family = "ubuntu-2204-lts"
}

data "yandex_compute_image" "image02" {
  family = "centos-stream-8"
}


locals { 
  vms = {
    "vm-01" = {
        hostname                = "vm-01"
        image_id                = "${data.yandex_compute_image.image01.id}"
        },
    "vm-02" = {
        hostname                = "vm-02"
        image_id                = "${data.yandex_compute_image.image01.id}"
        }
    "vm-03" = {
        hostname                = "vm-03"
        image_id                = "${data.yandex_compute_image.image02.id}"
        }
    }
}
