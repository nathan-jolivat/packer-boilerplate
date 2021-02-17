## Validate syntax
`packer validate .` at root path directory

## Build image on all source providers
`packer build .`

## Build image on specific source providers
`packer build --only=digitalocean.parallel-DO .`

This command works for source called as `source "digitalocean" "parallel-DO" {`