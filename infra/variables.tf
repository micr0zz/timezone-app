variable "main_region" {
  type = string
  default = "eu-west-1"
}

variable "availability_zone" {
  type = list
  default = ["eu-west-1a","eu-west-1b"]
}

variable "timezone_app_name" {
  type = string
  default = "timezone"
}

variable "chart_name" {
  type = string
  default = "timezoneapp"
}

variable "repo_name" {
  type = string
  default = "timezone-repository"
}
