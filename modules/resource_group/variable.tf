variable "resource_group_variable" {
  type = map(object({
    name     = string
    location = string
  }))

}