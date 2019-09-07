# Cloud resources configuration

variable "name" {
  type = string

  default = "bitcoin"

  description = <<-DESCRIPTION
    Name of service.
    Used as name prefix when generating hostnames.
  DESCRIPTION
}

variable "servers" {
  type = number

  default = 1

  description = <<-DESCRIPTION
    Count of servers to create.
  DESCRIPTION
}

variable "random_id" {
  type = bool

  default = true

  description = <<-DESCRIPTION
    Appends random id to droplet's name if `true`.
  DESCRIPTION
}

variable "domain" {
  type = string

  default = ""

  description = <<-DESCRIPTION
    Domain name.
    Host will be registered in this domain if non-empty value assigned.
  DESCRIPTION
}

variable "domain_ttl" {
  type = number

  default = 300

  description = <<-DESCRIPTION
    TTL in seconds for domain records.
  DESCRIPTION
}

variable "region" {
  type = string

  description = <<-DESCRIPTION
    Required.
    DigitalOcean region for droplet creation.
  DESCRIPTION
}

variable "ssh_keys" {
  type = list(number)

  default = []

  description = <<-DESCRIPTION
    List of SSH keys registered in DigitalOcean.
    User `root` authorized with this keys.
  DESCRIPTION
}

variable "tags" {
  type = list

  default = []

  description = <<-DESCRIPTION
    List of existing tags for droplet.
  DESCRIPTION
}

variable "size" {
  type = string

  default = "s-1vcpu-1gb"

  description = <<-DESCRIPTION
    Size of droplet.
  DESCRIPTION
}

variable "resize_disk" {
  type = bool

  default = false

  description = <<-DESCRIPTION
    Controlling whether to increase the disk size when resizing a Droplet.
    When set to false, only the Droplet's RAM and CPU will be resized.
    Increasing a Droplet's disk size is a permanent change.
    Increasing only RAM and CPU is reversible.
  DESCRIPTION
}

variable "backups" {
  type = bool

  default = false

  description = <<-DESCRIPTION
    Enable backups feature for droplet.
  DESCRIPTION
}

variable "ipv6" {
  type = bool

  default = false

  description = <<-DESCRIPTION
    Enable IPv6 address on droplet.
  DESCRIPTION
}

variable "private_networking" {
  type = bool

  default = true

  description = <<-DESCRIPTION
    Enable DigitalOcean private networking.
  DESCRIPTION
}

variable "monitoring" {
  type = bool

  default = true

  description = <<-DESCRIPTION
    Enable DigitalOcean monitoring.
  DESCRIPTION
}

variable "volume_size" {
  type = number

  default = 0

  description = <<-DESCRIPTION
    Size of data volume in gigabytes.
    If zero, no volume will be created.
  DESCRIPTION
}

variable "trusted_sources" {
  type = list(string)

  description = <<-DESCRIPTION
    Required.
    IP list to allow SSH and bitcoin rpc connections from.
  DESCRIPTION
}

# Provisioner confiuration

variable "provisioner_username" {
  type = string

  default = "provisioner"

  description = <<-DESCRIPTION
    This user will be added and used inside this module only.
  DESCRIPTION
}

variable "provisioner_homedir" {
  type = string

  default = "/home/provisioner"

  description = <<-DESCRIPTION
    Home directory of `provisioner_username`.
  DESCRIPTION
}
