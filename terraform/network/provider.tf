terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "0.105.0"
      configuration_aliases = [ yandex.primary ]
    }
  }
}
