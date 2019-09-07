variable "domain" {
  default = "example.com"
}

variable "region" {
  default = "fra1"
}

variable "ssh_keys" {
  default = []
}

variable "trusted_sources" {
  default = ["0.0.0.0/0", "::/0"]
}

variable "with_no_volume_servers" {
  default = 1
}

variable "with_volume_servers" {
  default = 1
}
