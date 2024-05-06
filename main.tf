resource "aws_instance" "ami" {
  ami                    = data.aws_ami.image.id
  instance_type          = "t3.small"
  vpc_security_group_ids = [data.aws_security_group.main.id]

  tags = {
    Name = "ami-server"
  }

}

resource "null_resource" "ansible" {

  connection {
    type     = "ssh"
    user     = jsondecode(data.vault_generic_secret.ssh.data_json).ansible_user
    password = jsondecode(data.vault_generic_secret.ssh.data_json).ansible_password
    host     = aws_instance.ami.private_ip
  }

  provisioner "remote-exec" {

    inline = [
      "sudo pip3.11 install ansible hvac"
    ]
  }
}
