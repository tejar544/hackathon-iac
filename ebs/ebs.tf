

resource "aws_ebs_volume" "EBS" {
  availability_zone     = var.availability_zone
  size                  = var.size  
  encrypted             = var.encrypted 
  iops                  = var.type == "io1" ? var.iops :"0"
  multi_attach_enabled  = var.multi_attach_enabled 
  #snapshot_id          = var.snapshot_id
  outpost_arn           = var.outpost_arn 
  type                  = var.type 
  kms_key_id            = var.kms_key_id 
  tags = {
    Name = "continuum-EBS"
  }


 #resource"aws_volume_attachment" "insta_vol"{

  # device_name   ="/dev/sdv"
  # volume_id     = aws_ebs_volume.data-vol.id
  # instance_id   = aws_instance.as_conti.id

 #}
}
