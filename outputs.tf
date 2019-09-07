output "ipv4" {
  value = digitalocean_droplet.server.*.ipv4_address
}

output "ipv4_private" {
  value = digitalocean_droplet.server.*.ipv4_address_private
}

output "ipv6" {
  value = digitalocean_droplet.server.*.ipv6_address
}

output "name" {
  value = digitalocean_droplet.server.*.name
}

output "fqdn" {
  value = formatlist("%s${var.domain == "" ? "" : ".${var.domain}"}", digitalocean_droplet.server.*.name)
}

output "private_key" {
  value     = tls_private_key.provisioner.*.private_key_pem
  sensitive = true
}

output "public_key" {
  value = tls_private_key.provisioner.*.public_key_openssh
}
