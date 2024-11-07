resource "aws_ecs_cluster" "simpsons_cluster" {
  name = "simpsons-cluster"
}

resource "aws_ecs_task_definition" "simpsons_task" {
  track_latest = true

  family                   = "simpsons-task"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = "256"
  memory                   = "512"
  execution_role_arn       = aws_iam_role.ecs_task_execution_role.arn

  container_definitions = jsonencode([
    {
      name      = "simpsons-container"
      image     = "${aws_ecr_repository.simpsons.repository_url}:latest"
      cpu       = 256
      memory    = 512
      essential = true
      portMappings = [
        {
          containerPort = 4567
          hostPort      = 4567
          protocol      = "tcp"
        }
      ]
    }
  ])
}

resource "aws_ecs_service" "simpsons_service" {
  name            = "simpsons-service"
  cluster         = aws_ecs_cluster.simpsons_cluster.id
  task_definition = aws_ecs_task_definition.simpsons_task.arn
  launch_type     = "FARGATE"
  desired_count   = 1

  network_configuration {
    subnets          = [aws_subnet.private_1.id, aws_subnet.private_2.id] # Use the two public subnets
    security_groups  = [aws_security_group.ecs_sg.id]
    assign_public_ip = false
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.ecs_tg.arn
    container_name   = "simpsons-container"
    container_port   = 4567
  }
}
