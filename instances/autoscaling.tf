resource "aws_launch_configuration" "launchconfig" {
  name_prefix     = "launchconfig"
  image_id        = data.aws_ami.ubuntu.id
  instance_type   = "t2.micro"
  key_name        = aws_key_pair.mykey.key_name
  security_groups = [aws_security_group.allow-ssh.id, aws_security_group.allow-http.id]
  user_data       = data.template_cloudinit_config.cloudinit-example.rendered
}

resource "aws_autoscaling_group" "autoscaling" {
  name                      = "autoscaling"
  vpc_zone_identifier       = [var.PUBLIC_SUBNET_1_ID, var.PUBLIC_SUBNET_2_ID]
  launch_configuration      = aws_launch_configuration.launchconfig.name
  min_size                  = 1
  max_size                  = 2
  health_check_grace_period = 300
  health_check_type         = "EC2"
  force_delete              = true

  tag {
    key                 = "Name"
    value               = "asg ec2 instance"
    propagate_at_launch = true
  }
}

