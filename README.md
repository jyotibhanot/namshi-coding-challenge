# Namshi Coding Challenge

# Problem Statement
- To write terraform code to launch single node kubernetes cluster using terraform and ansible.

# Setup
- Install prerequisites.
  - Terraform
- Clone repo. [https://github.com/jyotibhanot30/namshi-coding-challenge.git]
- Fill in variables.tf
  - aws_access_key
  - aws_secret_key
  - key_name
  - aws_region
- Launch one master and one worker node with Terraform.
  - Kubernetes components are installed using Ansible. 
  - Ansible playbook run is done through userdata.
- Create cluster join command on master.
  - kubeadm token create --print-join-command
- Run cluster join command on worker.

# Commands:
- On local Linux System:
  - wget https://releases.hashicorp.com/terraform/0.12.3/terraform_0.12.3_linux_amd64.zip
  - sudo apt-get install git unzip
  - unzip terraform_0.12.3_linux_amd64.zip
  - mv terraform /usr/local/bin
  - terraform --version
  - git clone https://github.com/jyotibhanot30/namshi-coding-challenge.git
  - cd namshi-coding-challenge/terraform/ec2-terraform
  - terraform init
  - terraform plan
  - terraform apply

- Terraform Output gives us:
  1. Master IP
  2. Worker IP
  3. Key Name
  4. SSH User

- On Master
  - kubeadm token create --print-join-command
  [Copy the join-command]

- On Worker
  [Run join-command with sudo]

# Package Versions:
- Terraform: v0.12.3
- Ansible: 2.7.10

# Further Scope:
- Terraform state files can be stored in S3 bucket.
- Output of kubeadm token create command can be moved to SQS which would be the single source of the join command
  for all worker nodes.
