resource "aws_security_group" "k8s_sg" {
  name        = "k8s-sg"
  description = "Allow SSH inbound traffic"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 6443
    to_port     = 6443
    protocol    = "tcp"
    self        = true    
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "k8s_master" {
  ami             = "${data.aws_ami.ubuntu.id}"
  instance_type   = "${var.instance_type}"
  key_name        = "${var.key_name}"
  user_data       = "${data.template_file.k8s-master.rendered}"
  security_groups = [
    "${aws_security_group.k8s_sg.name}",
  ]
  tags = {
    Name    = "k8s-master"
    Purpose = "k8s-single-node"
  }
}

resource "aws_instance" "k8s_worker" {
  ami             = "${data.aws_ami.ubuntu.id}"
  instance_type   = "${var.instance_type}"
  key_name        = "${var.key_name}"
  user_data       = "${data.template_file.k8s-worker.rendered}"
  security_groups = [
    "${aws_security_group.k8s_sg.name}",
  ]
  tags = {
    Name    = "k8s-worker"
    Purpose = "k8s-single-node"
  }
}
