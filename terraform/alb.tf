resource "aws_lb" "app_alb" {
  name               = "simpsons-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb_sg.id]
  subnets            = [aws_subnet.public_1.id, aws_subnet.public_2.id] # Use the two public subnets
}

resource "aws_lb_target_group" "ecs_tg" {
  name        = "simpsons-tg-${substr(uuid(), 0, 3)}"
  port        = 4567
  protocol    = "HTTP"
  target_type = "ip" # Set the target type to 'ip' for Fargate compatibility
  vpc_id      = aws_vpc.main.id
  lifecycle {
    create_before_destroy = true
  }

}

resource "aws_lb_listener" "app_listener" {
  load_balancer_arn = aws_lb.app_alb.arn
  port              = 80
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.ecs_tg.arn
  }
}
