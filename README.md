# Usage

## Validate syntax
Exec at root path directory: `$ packer validate .` 


## Build image on all source providers
`$ packer build .`

## Build image on specific source providers
`$ packer build --only=digitalocean.parallel-DO .`

This command works for source called as `source "digitalocean" "parallel-DO" {`

---

## ![AWS logo](https://a0.awsstatic.com/libra-css/images/site/fav/favicon.ico) For AWS deployment, additionnal configuration

The default location is `$HOME/.aws/credentials` on 🐧 *Linux* and 🍏 *OS X*, or `%USERPROFILE%.aws\credentials` for 💩 *Windows*.

## For Windows 

📁 Create folder called "aws" at `%USERPROFILE%` folder

📄 Create file called "credentials" into `aws` folder

✍ Add default content to `credentials` file like below:
```
[default]
aws_access_key_id=**********************
aws_secret_access_key=********************************************
```

## Define default creds into Packer config file (.pkr.hcl)

✍ For each ![AWS logo](https://a0.awsstatic.com/libra-css/images/site/fav/favicon.ico) AWS `source { }` add line like below: 
```
profile = "default"
```
🧨 And remove lines from `parallel.pkr.hcl` file if they exist:
```
access_key    = "${var.aws_access_key}"
secret_key    = "${var.aws_secret_key}"
```
