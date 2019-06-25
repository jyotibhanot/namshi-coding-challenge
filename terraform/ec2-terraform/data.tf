# USERDATA
data "template_file" "k8s-master" {
    template = "${file("${path.module}/userdata-k8s-master.sh")}"
}

data "template_file" "k8s-worker" {
    template = "${file("${path.module}/userdata-k8s-worker.sh")}"
}

# AMI
data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-xenial-16.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}
