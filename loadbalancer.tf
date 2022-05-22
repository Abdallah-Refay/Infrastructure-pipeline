resource "aws_lb_target_group" "tf_lb_target_group" {
  name     = "tf-nlb-tg"
  port     = 3000
  protocol = "TCP"
  vpc_id   = module.network.vpc_id
}


resource "aws_lb_target_group_attachment" "priavte" {
  target_group_arn = aws_lb_target_group.tf_lb_target_group.arn
  target_id        = aws_instance.private1.id
  port             = 3000
}


resource "aws_lb" "network_lb" {
  name               = "tf-nlb"
  internal           = false
  load_balancer_type = "network"
  subnets            = [module.network.public_sub1_id, module.network.public_sub2_id]
}

resource "aws_lb_listener" "lb_listener" {
  load_balancer_arn = aws_lb.network_lb.arn
  port              = "80"
  protocol          = "TCP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tf_lb_target_group.arn
  }
}
