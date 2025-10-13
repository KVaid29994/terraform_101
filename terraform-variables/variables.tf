variable "aws_instance_type" {
  description = "The type of instance i want to create"
  type = string
  validation {
    condition = var.aws_instance_type=="t2.micro" || var.aws_instance_type=="t3.micro"
    error_message = "Invalid or too large messages"
  }
}


variable "root_volume_size" {
  description = "Define the size of the volume"
  type =  number
  default = 20
}

variable "root_volume_type" {
  type = string
  description = "Enter the value of volume size"
  default = "gp2"
  
}

variable "ec2_config" {
  type = object({
    v_size = number
    v_type = string
  })

  default = {
    v_size = 20
    v_type = "gp2"
  }
}

variable "additional_tags" {
  type = map(string) #expecting key = value format
  default = { stage = "prod"
  }
}