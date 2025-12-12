variable "region" {
  description = "AWS region"
  default     = "us-east-1"
}

variable "app_name" {
  description = "Name of the application"
  default     = "simple-time-service"
}

variable "container_image" {
  description = "Docker image to deploy"
  type        = string
  default     = "docker.io/"
}

variable "container_port" {
  description = "Port the container listens on"
  default     = 5000
}
