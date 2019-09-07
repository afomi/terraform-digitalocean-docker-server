terraform {
  required_version = "~> 0.12.1"
}

# DigitalOcean token required
# ---
# provider "digitalocean" {
#   token = "...token..."
# }
#
# ...or...
#
# variable "do_token" {
#   default = "...token..."
# }
#
# provider "digitalocean" {
#   token = var.do_token
# }

# --- Without data volume

module "with_no_volume" {
  source          = "../../terraform-digitalocean-docker-server"
  servers         = var.with_no_volume_servers
  name            = "docker-server-with-no-volume"
  region          = var.region
  trusted_sources = var.trusted_sources
  ssh_keys        = var.ssh_keys
  domain          = var.domain
  volume_size     = 0
}

resource "null_resource" "test_with_no_volume" {
  count = var.with_no_volume_servers

  connection {
    host        = module.with_no_volume.ipv4[count.index]
    user        = "provisioner"
    private_key = module.with_no_volume.private_key[count.index]
    timeout     = "5m"
  }

  provisioner "remote-exec" {
    inline = [
      "whoami",
      "pwd",
      "ls -la",
      "df -h | grep LABEL",
      "cat /etc/fstab",
    ]
  }
}

# --- With data volume

module "with_volume" {
  source          = "../../terraform-digitalocean-docker-server"
  servers         = var.with_volume_servers
  name            = "docker-server-with-volume"
  region          = var.region
  trusted_sources = var.trusted_sources
  ssh_keys        = var.ssh_keys
  domain          = var.domain
  volume_size     = 10
}

resource "null_resource" "test_with_volume" {
  count = var.with_volume_servers

  connection {
    host        = module.with_volume.ipv4[count.index]
    user        = "provisioner"
    private_key = module.with_volume.private_key[count.index]
    timeout     = "5m"
  }

  provisioner "remote-exec" {
    inline = [
      "whoami",
      "pwd",
      "ls -la",
      "df -h | grep LABEL",
      "cat /etc/fstab",
    ]
  }
}
