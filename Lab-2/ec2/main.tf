resource "aws_instance" "instance" {
  for_each               = var.instance_count
  ami                    = var.ami
  instance_type          = var.instance_type
  vpc_security_group_ids = var.security_group_ids
  subnet_id              = var.subnet_id
  root_block_device {
    volume_size           = var.volume_size
    volume_type           = var.volume_type
    delete_on_termination = "true"
    tags = {
      Name        = "${var.basename}-${format("%02g", each.key)}"
      Terraform   = "true"
      Environment = var.environment
    }
  }
  associate_public_ip_address = var.associate_public_ip_address
  key_name                    = var.ssh_key_name
  tags = {
    Name        = "${var.basename}-${format("%02g", each.key)}"
    Terraform   = "true"
    Environment = var.environment
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/script.sh",
      "/tmp/script.sh"
    ]
  }
}