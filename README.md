# Docker server

- Creates virtual server(s) with docker
- Creates cloud volume(s) and mount to /srv
- Auto resize fs on data volume when size of volume changed
- Register server(s) in domain `var.domain`
- Creates cloud firewall and apply network policy to server(s)
- Create `var.provisioner` user

## Cloud resources

- DigitalOcean droplet
- DigitalOcean volume
- DigitalOcean cloud firewall

## Default firewall rules

### Incoming

- Allow SSH from `var.trusted_sources`
- Allow icmp from world

### Outgoing

- Allow tcp to world
- Allow udp to world
- Allow icmp to world
