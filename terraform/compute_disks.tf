resource "yandex_compute_disk" "disk-server-1" {
  name     = "disk-vm-server1"
  type     = "network-ssd"
  zone     = "ru-central1-a"
  image_id = "fd88rqql4soidsdqf98a"
  size     = 8

}

resource "yandex_compute_disk" "disk-server-2" {
  name     = "disk-vm-server2"
  type     = "network-ssd"
  zone     = "ru-central1-b"
  image_id = "fd88rqql4soidsdqf98a"
  size     = 8

}

resource "yandex_compute_disk" "disk-bastion" {
  name     = "disk-vm-bastion"
  type     = "network-hdd"
  zone     = "ru-central1-b"
  image_id = "fd8mfcsu31d3139ufj78"
  size     = 10
}

resource "yandex_compute_disk" "disk-zabbix" {
  name     = "disk-vm-zabbix"
  type     = "network-ssd"
  zone     = "ru-central1-b"
  image_id = "fd88rqql4soidsdqf98a"
  size     = 8

}

resource "yandex_compute_disk" "disk-elastic" {
  name     = "disk-vm-elastic"
  type     = "network-ssd"
  zone     = "ru-central1-b"
  image_id = "fd88rqql4soidsdqf98a"
  size     = 10

}

resource "yandex_compute_disk" "disk-kibana" {
  name     = "disk-vm-kibana"
  type     = "network-hdd"
  zone     = "ru-central1-b"
  image_id = "fd88rqql4soidsdqf98a"
  size     = 8

}
