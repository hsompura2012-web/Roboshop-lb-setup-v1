resource "aws_instance" "instance_launch" {
  for_each = var.db_component
  ami           = var.ami
  instance_type = each.value["instance_type"]
  vpc_security_group_ids = [aws_security_group.db_sg[each.key].id]
  user_data = templatefile("${path.module}/userdata.sh", {component = each.key, env = var.env } )

    tags = {
    Name = "${each.key}-${var.env}"
  }

}

resource "aws_route53_record" "Record_Launch" {
  for_each =  var.db_component
  zone_id = var.zone_id
  name    = "${each.key}-${var.env}"
  type    = "A"
  ttl     = 50
  records = [aws_instance.instance_launch[each.key].private_ip]
}

