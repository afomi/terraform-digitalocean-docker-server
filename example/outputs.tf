output "ipv4" {
  value = concat(module.with_no_volume.ipv4, module.with_volume.ipv4)
}

output "ipv4_private" {
  value = concat(module.with_no_volume.ipv4_private, module.with_volume.ipv4_private)
}

output "ipv6" {
  value = concat(module.with_no_volume.ipv6, module.with_volume.ipv6)
}

output "name" {
  value = concat(module.with_no_volume.name, module.with_volume.name)
}
