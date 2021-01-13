resource "aws_instance" "linuxSRV" {
  instance_type = var.instance_type
  ami = var.image_id
  security_groups = [aws_security_group.SGLAB.name]
  tags = var.ec2_tag
}

#EBS Volume and Attachment
resource "aws_ebs_volume" "volume" {
  availability_zone = var.availability_zone
  size              = var.size
  tags              = var.volume_tag
}
resource "aws_volume_attachment" "ebs_att" {
  device_name = var.device_name
  volume_id   = aws_ebs_volume.volume.id
  instance_id = aws_instance.linuxSRV.id
}
# Security Groups
resource "aws_security_group" "SGLAB" {
  name = "Allow HTTP & HTTPS"
  dynamic "ingress"{ 
    iterator = port
    for_each = var.ingressrules
    content {
      cidr_blocks = [ "0.0.0.0/0" ]
      description = "All"
      from_port = port.value
      to_port = port.value
      protocol = "TCP"
    }
  }
  dynamic "egress"{ 
    iterator = port
    for_each = var.egressrules
    content {
      cidr_blocks = [ "0.0.0.0/0" ]
      description = "All"
      from_port = port.value
      to_port = port.value
      protocol = "TCP"
    }
  }
}
