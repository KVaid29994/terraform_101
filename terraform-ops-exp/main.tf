terraform {}

# number list
variable "num_list" {
    type = list(number)
    default = [1,2,3,4,5,6]
}

# object list of employees
variable "object_list" {
  type = list(object({
    fname = string
    lname = string  
  }))
  default = [ {
    fname = "Kashish"
    lname = "vaid"
  },
  {
    fname = "Rajam"
    lname = "chawal"
  } ]
}


variable "map_list" {
  type = map(number)
  default = {
    "one" = 1
    "two" = 2
    "three" = 3
  }
}

## we are trying to manage information / data on terraform

# Calculations/Operations

locals {
  mul = 2*2
  add = 2+2
  eq = 2!=3
  doubles = [for num in var.num_list: num*2]
  odd = [for num in var.num_list :num if num%2!=0 ]
  ## to get only first name
  fname_list = [for person in var.object_list : person.fname]
  ## working with Map_list
  map_info = [for key,value in var.map_list: value*5]
  double_map = {
    for key,value in var.map_list :key => value*2
  }

}

output "output4" {
  value = local.double_map
}

output "output" {
  value = local.odd
}

output "output2" {
  value = local.fname_list
}

output "output3" {
  value = local.map_info
}