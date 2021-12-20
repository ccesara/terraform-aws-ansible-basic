## By Arcanjo Caio [ccesara87@gmail.com]
## Created -> Dec 2021


## Variables ##

## Attach your public key
variable "pair_key" {
  default = {
    "key_a" = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC3hwgcGrxxId0d86VOgsvXVzyPdQVdhUZh/q0Pf6xFpjc+lJXF1CTLMGpfe/J4b7+bakj4yNlCK/TawaI7TCW0i4LOu9bv3Spq+XWvXft0RTsjyd/dMLn384Jv7WBe5jHf0YGU14m9O2yl4Mlqbo0lo1fUlT3CKKd1LA/WJ5yI9XvzN33shY5RDCCS3ooWvm09Q5gAD2HhXZVW4ge3SCFr+YyTjv0JSSfGz69o7rSogfcMC+5Xe1QE34TDhmTgPt0erCyzOLiJKxsFgj0x6MrnOvQ4jFseQAQEIne5/Y+hkolc8Sba3slk7nJQB6LRSqFGbrgsHIVVvCOeaZijR8wztmyFWsN4rMrZDjXweMn+NR+y3nroWDiP846UKg8mvV7okg0kdOtq1GUA/N9LlUis3VgSb7qL/f1HVhmxCzU+FxDkbeD//1kuVTYW73eHdTlexek0BoodaTA0gneB6iLc4qjW/qFvRAlGWAbWMsWOWKD9aYhyeNvoHNpY4o9yJXs= ccesara@phobos"
  }
}

## AWS Region
variable "region" {
  default = {
    "virginia" = "us-east-1"
    "canada" = "ca-central-1"
  }
}

## I could make this dynamic.. next release
variable "availability_zone" {
  default = {
    "a" = "us-east-1a"
    "b" = "us-east-1b"
  }
  
}

## AWS AMI - there are variations between regions
variable "amis" {
  default = {
    "ubuntu20" = "ami-04505e74c0741db8d"
  }
}

## Instance Type
variable "instance_type" {
  default = {
    "micro" = "t2.micro"
    "medium" = "t2.medium"
  }
}
