# cluster
resource "aws_ecs_cluster" "my-cluster" {
  name = "my-cluster"
}

resource "aws_launch_configuration" "ecs-launchconfig" {
  name_prefix          = "ecs-launchconfig"
  image_id             = var.ECS_EU_WEST_1_AMI
  instance_type        = "t2.micro"
  key_name             = aws_key_pair.mykey.key_name
  iam_instance_profile = aws_iam_instance_profile.ecs-ec2-role.id
  security_groups      = [aws_security_group.allow-ssh.id, aws_security_group.allow-http.id]
  user_data            = "#!/bin/bash\necho 'ECS_CLUSTER=my-cluster' > /etc/ecs/ecs.config\nstart ecs"
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "ecs-autoscaling" {
  name                 = "ecs-autoscaling"
  vpc_zone_identifier  = [var.PUBLIC_SUBNET_1_ID, var.PUBLIC_SUBNET_2_ID]
  launch_configuration = aws_launch_configuration.ecs-launchconfig.name
  min_size             = 2
  max_size             = 4
  # health_check_type    = "ELB"
  # load_balancers       = [aws_elb.my-elb.name]
  tag {
    key                 = "Name"
    value               = "ecs-ec2-container"
    propagate_at_launch = true
  }
}

