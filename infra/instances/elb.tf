resource "aws_elb" "myapp-elb" {
  name = "myapp-elb"

  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  health_check {
    healthy_threshold   = 3
    unhealthy_threshold = 3
    timeout             = 30
    target              = "HTTP:80/"
    interval            = 60
  }

  cross_zone_load_balancing   = true
  idle_timeout                = 400
  connection_draining         = true
  connection_draining_timeout = 400

  subnets         = [var.PUBLIC_SUBNET_1_ID, var.PUBLIC_SUBNET_2_ID]
  security_groups = [aws_security_group.elb-securitygroup.id]

  tags = {
    Name = "myapp-elb"
  }
}
