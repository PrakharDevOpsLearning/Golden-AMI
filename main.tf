resource "aws_instance" "instance" {
  ami                    = data.aws_ami.image.id
  instance_type          = "t3.small"
  vpc_security_group_ids = [data.aws_security_group.main.id]

  tags = {
    Name = "ami-server"
  }

}

#resource "null_resource" "ansible" {
#
#  connection {
#    type     = "ssh"
#    user     = jsondecode(data.vault_generic_secret.ssh.data_json).ansible_user
#    password = jsondecode(data.vault_generic_secret.ssh.data_json).ansible_password
#    host     = aws_instance.instance.private_ip
#  }
#
#}

#  provisioner "remote-exec" {
#
#    inline = [
#      "rm -f ~/*.json",
#      "sudo pip3.11 install ansible hvac",
#      "ansible-pull -i localhost, -U https://github.com/PrakharDevOpsLearning/expense-ansible get-secrets.yml -e env=${var.env} -e role_name=${var.component} -e vault_token=${var.vault_token}",
#      "ansible-pull -i localhost, -U https://github.com/PrakharDevOpsLearning/expense-ansible expense.yml -e env=${var.env} -e role_name=${var.component} -e @~/secrets.json",
#    ]
#  }
