resource "aws_launch_template" "app" {
  for_each = var.app_component
  name = "${each.key}-${var.env}"
  image_id = var.ami
  instance_type = var.instance_type
  vpc_security_group_ids = [aws_security_group.app_sg[each.key].id]
  user_data = base64encode(templatefile("${path.module}/userdata.sh", {component = each.key, env = var.env } ))
  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "${each.key}-${var.env}"
    }
  }

}
resource "aws_lb_target_group" "app_tg" {
  for_each = var.app_component
  name     = "${each.key}-${var.env}"
  port     = each.value["port"]["app"]
  protocol = "HTTP"
  vpc_id = var.default_vpc_id

  health_check {
    path = "/health"
  }
}

resource "aws_autoscaling_group" "app_asg" {
  for_each = var.app_component

  name               = "${each.key}-${var.env}"
  availability_zones = ["us-east-1a","us-east-1b"]
  desired_capacity   = each.value["min_size"]
  max_size           = each.value["max_size"]
  min_size           = each.value["min_size"]
  //target_group_arns = [aws_lb_target_group.app_tg[each.key].arn]
  launch_template {
    id      = aws_launch_template.app[each.key].id
    version = "$Latest"
  }
  //depends_on = [aws_route53_record.Record_DNS_Launch]

}



