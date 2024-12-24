# Web-Servers 
resource "yandex_compute_instance" "server-1" {
  name                      = "vm-server-1"
  hostname                  = "server1"
  zone                      = "ru-central1-a"

  resources {
    cores         = 2
    memory        = 2
    core_fraction = 20
  }

  boot_disk {
    disk_id = yandex_compute_disk.disk-server-1.id
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnet_server-1.id
    dns_record {
      fqdn = "server1.srv."
      ttl  = 300
    }
    security_group_ids = [yandex_vpc_security_group.internal.id]
    ip_address         = "172.16.1.3"
  }

  metadata = {
    user-data = "${file("meta.txt")}"
  }

  scheduling_policy {
    preemptible = false
  }
}

resource "yandex_compute_instance" "server-2" {
  name                      = "vm-server-2"
  hostname                  = "server2"
  zone                      = "ru-central1-b"

  resources {
    cores         = 2
    memory        = 2
    core_fraction = 20
  }

  boot_disk {
    disk_id = yandex_compute_disk.disk-server-2.id
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnet_server-2.id
    dns_record {
      fqdn = "server2.srv."
      ttl  = 300
    }
    security_group_ids = [yandex_vpc_security_group.internal.id]
    ip_address         = "172.16.2.3"
  }

  metadata = {
    user-data = "${file("meta.txt")}"
  }

  scheduling_policy {
    preemptible = false
  }
}

# bastion-server
resource "yandex_compute_instance" "bastion" {
  name                      = "vm-bastion"
  hostname                  = "bastion"
  zone                      = "ru-central1-b"

  resources {
    cores         = 2
    memory        = 2
    core_fraction = 20
  }

  boot_disk {
    disk_id = yandex_compute_disk.disk-bastion.id
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.public.id
    dns_record {
      fqdn = "bastion.srv."
      ttl  = 300
    }
    nat                = true
    security_group_ids = [yandex_vpc_security_group.internal.id, yandex_vpc_security_group.public-bastion.id]
    ip_address         = "172.16.4.4"
  }

  metadata = {
    user-data = "${file("meta.txt")}"
  }

  scheduling_policy {
    preemptible = false
  }
}


# Zabbix 
resource "yandex_compute_instance" "zabbix" {
  name                      = "vm-zabbix"
  hostname                  = "zabbix"
  zone                      = "ru-central1-b"

  resources {
    cores         = 2
    memory        = 4
    core_fraction = 20
  }

  boot_disk {
    disk_id = yandex_compute_disk.disk-zabbix.id
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.public.id
    dns_record {
      fqdn = "zabbix.srv."
      ttl  = 300
    }
    nat                = true
    security_group_ids = [yandex_vpc_security_group.internal.id, yandex_vpc_security_group.public-zabbix.id]
    ip_address         = "172.16.4.5"
  }

  metadata = {
    user-data = "${file("meta.txt")}"
  }

  scheduling_policy {
    preemptible = false
  }
}

# Elasticsearch
resource "yandex_compute_instance" "elastic" {
  name                      = "vm-elastic"
  hostname                  = "elastic"
  zone                      = "ru-central1-b"

  resources {
    cores         = 2
    memory        = 8
    core_fraction = 20
  }

  boot_disk {
    disk_id = yandex_compute_disk.disk-elastic.id
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.private.id
    dns_record {
      fqdn = "elastic.srv."
      ttl  = 300
    }
    security_group_ids = [yandex_vpc_security_group.internal.id]
    ip_address         = "172.16.3.4"
  }

  metadata = {
    user-data = "${file("meta.txt")}"
  }

  scheduling_policy {
    preemptible = false
  }
}

# Kibana
resource "yandex_compute_instance" "kibana" {
  name                      = "vm-kibana"
  hostname                  = "kibana"
  zone                      = "ru-central1-b"


  resources {
    cores         = 2
    memory        = 2
    core_fraction = 20
  }

  boot_disk {
    disk_id = yandex_compute_disk.disk-kibana.id
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.public.id
    dns_record {
      fqdn = "kibana.srv."
      ttl  = 300
    }
    nat                = true
    security_group_ids = [yandex_vpc_security_group.internal.id, yandex_vpc_security_group.public-kibana.id]
    ip_address         = "172.16.4.3"
  }

  metadata = {
    user-data = "${file("meta.txt")}"
  }

  scheduling_policy {
    preemptible = false
  }
}

