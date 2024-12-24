output "external_ip_address_bastion" {
  value = yandex_compute_instance.bastion.network_interface.0.nat_ip_address
}


output "FQDN_bastion" {
  value = yandex_compute_instance.bastion.fqdn
}

output "external_ip_address_zabbix" {
  value = yandex_compute_instance.zabbix.network_interface.0.nat_ip_address
}


output "FQDN_zabbix" {
  value = yandex_compute_instance.zabbix.fqdn
}



output "internal_ip_address_kibana" {
  value = yandex_compute_instance.kibana.network_interface.0.ip_address
}

output "FQDN_kibana" {
  value = yandex_compute_instance.kibana.fqdn
}



output "FQDN_elastic" {
  value = yandex_compute_instance.elastic.fqdn
}


output "FQDN_server-1" {
  value = yandex_compute_instance.server-1.fqdn
}


output "FQDN_server-2" {
  value = yandex_compute_instance.server-2.fqdn
}

output "external_ip_address_L7balancer" {
  value = yandex_alb_load_balancer.l7b.listener.0.endpoint.0.address.0.external_ipv4_address
}
