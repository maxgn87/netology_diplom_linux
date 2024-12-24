terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"
}

provider "yandex" {
  token     = var.yandex_cloud_token
  cloud_id  = "b1gmq91fn04seo7mekog"
  folder_id = "b1grnmnc8gclbga07je9"
  zone      = "ru-central1-a"
}