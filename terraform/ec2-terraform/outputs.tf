output "k8s_instance_ip" {
  value = "${aws_instance.k8s_instance.public_ip}"
}

output "key_name" {
  value = "${aws_instance.k8s_instance.key_name}"
}

output "ssh_user" {
  value = "ubuntu"
}
