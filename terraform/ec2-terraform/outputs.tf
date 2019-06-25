output "k8s_master_ip" {
  value = "${aws_instance.k8s_master.public_ip}"
}

output "k8s_worker_ip" {
  value = "${aws_instance.k8s_worker.public_ip}"
}

output "key_name" {
  value = "${aws_instance.k8s_master.key_name}"
}

output "ssh_user" {
  value = "ubuntu"
}
