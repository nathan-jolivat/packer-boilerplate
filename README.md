## Validate syntax
Exec at root path directory: `$> packer validate .` 


## Build image on all source providers
`$> packer build .`

## Build image on specific source providers
`$> packer build --only=digitalocean.parallel-DO .`

This command works for source called as `source "digitalocean" "parallel-DO" {`