#####
#####  ALB

variable "alb_name" {
     description = "The name of the LB. This name must be unique within your AWS account, can have a maximum of 32 characters, must contain only alphanumeric characters or hyphens, and must not begin or end with a hyphen. If not specified, Terraform will autogenerate a name beginning with tf-lb."
     default     = ""
}

variable "alb_internal" {
     description = "(Optional) If true, the LB will be internal."
     default     = ""
}

variable "alb_load_balancer_type" {
     description = "(Optional) The type of load balancer to create. Possible values are application or network. The default value is application."
     default     = ""
}

variable "alb_security_groups" {
     description = "(Optional) A list of security group IDs to assign to the LB. Only valid for Load Balancers of type application."
     default     = ""
}

variable "alb_subnets" {
     description = "(Optional) A list of subnet IDs to attach to the LB. Subnets cannot be updated for Load Balancers of type network. Changing this value will for load balancers of type network will force a recreation of the resource."
     default     = []
}

variable "alb_enable_deletion_protection" {
     description = "(Optional) If true, deletion of the load balancer will be disabled via the AWS API. This will prevent Terraform from deleting the load balancer. Defaults to false."
     default     = ""
}

variable "alb_tag_name" {
     description = "(Optional) A mapping of tags to assign to the resource."
     default     = ""
}

variable "alb_environment" {
     description = "(Optional) A mapping of tags to assign to the resource."
     default     = ""
}

#####  ALB LISTENER


variable "aws_lb_listener_port" {
     description = "The port on which the load balancer is listening. like 80 or 443"
     default     = ""
}

variable "aws_lb_listener_protocol" {
     description = "The protocol for connections from clients to the load balancer. Valid values are TCP, HTTP and HTTPS. Defaults to HTTP"
     default     = ""
}


variable "aws_lb_listener_ssl_policy" {
     description = "The name of the SSL Policy for the listener. Required if protocol is HTTPS"
     default     = ""
}

variable "aws_lb_listener_certificate_arn" {
     description = "The ARN of the SSL server certificate. Exactly one certificate is required if the protocol is HTTPS"
     default     = ""
}


#####  ALB TARGET GROUP

variable "aws_lb_target_group_name" {
     description = "The name of the target group. If omitted, Terraform will assign a random, unique name."
     default     = ""
}


variable "aws_lb_target_group_port" {
     description = "The port on which targets receive traffic, unless overridden when registering a specific target."
     default     = ""
}


variable "aws_lb_target_group_protocol" {
     description = "The protocol to use for routing traffic to the targets."
     default     = ""
}

variable "aws_lb_target_group_vpc_id" {
     description = "The identifier of the VPC in which to create the target group."
     default     = ""
}

#####  ALB TARGET GROUP ATTACHMENT 1


variable "aws_lb_target_group_attachment_instance_id1" {
     description = "The ID of the target. This is the Instance ID for an instance, or the container ID for an ECS container. If the target type is ip, specify an IP address."
     default     = ""
}


variable "aws_lb_target_group_attachment_port1" {
     description = "The port on which targets receive traffic."
     default     = ""
}

#####  ALB TARGET GROUP ATTACHMENT 2


variable "aws_lb_target_group_attachment_instance_id2" {
     description = "The ID of the target. This is the Instance ID for an instance, or the container ID for an ECS container. If the target type is ip, specify an IP address."
     default     = ""
}


variable "aws_lb_target_group_attachment_port2" {
     description = "The port on which targets receive traffic."
     default     = ""
}
