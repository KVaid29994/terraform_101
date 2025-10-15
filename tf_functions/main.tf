terraform {}

locals {
  value = "hello world! 1#2@2"
}

variable "string_list" {
    type = list(string)
    default = [ "serv1", "serv2", "serv3", "serv1" ]
  
}

output "output1" {
  value = upper(local.value)
}

output "output2" {
  value = startswith(local.value,"plan")
}

output "output3" {
  value = split(" ",local.value)
}

output "output4" {
  value = regexall("[^ @]+", local.value)
}

output "output5" {
  value = min(1,2,4,5)
}

output "output6" {
  value = abs(-1.1)
}

output "output7" {
  value = length(var.string_list)
}

output "output8" {
  value = join("@", var.string_list)
}

output "output9" {
  value = contains(var.string_list,"server")
}
output "output10" {
  value = contains(var.string_list,"serv1")
}

output "output11" {
  value = toset(var.string_list)
}