# Usage

## Validate syntax
Exec at root path directory: `$ packer validate .` 


## Build image on all source providers
`$ packer build .`

## Build image on specific source providers
`$ packer build --only=digitalocean.parallel-DO .`

This command works for source called as `source "digitalocean" "parallel-DO" {`

---

# For AWS deployment, additionnal configuration

The default location is $HOME/.aws/credentials on Linux and OS X, or %USERPROFILE%.aws\credentials for Windows users.

## For Windows 

📁 Create folder called "aws" at `%USERPROFILE%` folder

📄 Create file called "credentials" into `aws` folder

✍ Add default content to `credentials` file like below:
```
[default]
aws_access_key_id=AKIAIRHOKU6D2MTJVDNA
aws_secret_access_key=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
```

## Define default creds into Packer config file (.pkr.hcl)

✍ For each `source { }` add line like below: 
```
profile = "default"
```
🧨 And remove lines like this:
```
access_key    = "${var.aws_access_key}"
secret_key    = "${var.aws_secret_key}"
```
