# source blocks are generated from your builders; a source can be referenced in
# build blocks. A build block runs provisioners and post-processors on a
# source.
source "amazon-ebs" "parallel-AWS" {
  profile       = "default"
  ami_name      = var.ami_name
  instance_type = "t2.micro"
  region        = var.region
  source_ami_filter {
    filters = {
      name                = "ubuntu/images/*ubuntu-xenial-16.04-amd64-server-*"
      root-device-type    = "ebs"
      virtualization-type = "hvm"
    }
    most_recent = true
    owners      = ["099720109477"]
  }
  ssh_username = "ubuntu"
}

source "digitalocean" "parallel-DO" {
  api_token    = var.do_api_token
  image        = "ubuntu-20-04-x64"
  region       = var.region_do
  size         = "s-1vcpu-1gb"
  ssh_username = "root"
}

# a build block invokes sources and runs provisioning steps on them.
build {
  sources = ["source.amazon-ebs.parallel-AWS"]

  provisioner "file" {
    destination = "/home/ubuntu/"
    source      = "./script/welcome.txt"
  }
  provisioner "shell" {
    inline = ["ls -al /home/ubuntu", "cat /home/ubuntu/welcome.txt"]
  }
  provisioner "shell" {
    script = "./script/bootstrap.sh"
  }
}

# a build block invokes sources and runs provisioning steps on them.
# UBUNTU SSH USER DOESNT EXISTS AT DO PROVIDER - keep root home directory path instead!
build {
  sources = ["source.digitalocean.parallel-DO"]

  provisioner "file" {
    destination = "/root/"
    source      = "./script/welcome.txt"
  }
  provisioner "shell" {
    inline = ["ls -al /root", "cat /root/welcome.txt"]
  }
  provisioner "shell" {
    script = "./script/bootstrap.sh"
  }
}