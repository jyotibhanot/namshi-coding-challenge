resource "aws_security_group" "k8s_sg" {
  name        = "k8s-sg"
  description = "Allow SSH inbound traffic"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "k8s_instance" {
  ami             = "${data.aws_ami.ubuntu.id}"
  instance_type   = "${var.instance_type}"
  key_name        = "${var.key_name}"
  user_data       = "${data.template_file.k8s-master.rendered}"
  security_groups = [
    "${aws_security_group.k8s_sg.name}",
  ]
  tags = {
    Name    = "k8s-instance"
    Purpose = "k8s-single-node"
  }
}
