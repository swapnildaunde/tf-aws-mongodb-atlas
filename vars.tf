variable "public_key" {
  description = "Public Key of the mongodb atlas cluster."
  type        = string
}

variable "private_key" {
  description = "Private Key of the mongodb atlas cluster."
  type        = string
}

variable "cluster_name" {
  description = "mongodb atlas cluster name."
  type        = string
  default = "animals-mongo"
}

variable "user" {
  description = "MongoDB Atlas User"
  type        = list(string)
  default     = ["asfa","sfafg"]
}
variable "password" {
  description = "MongoDB Atlas User Password"
  type        = list(string)
  default = [ "Aa123456" ]
}
variable "database_name" {
  description = "The Database in the cluster"
  type        = list(string)
  default = ["aaa"]
}

variable "org_id" {
  description = "MongoDB Organization ID"
}

variable "region" {
  description = "MongoDB Atlas Cluster Region"
  type        = string
  default     = "eu-west-1"

}

variable "atlasprojectid" {
  description = "Atlas project ID"
}

variable "atlas_region" {
  default     = "US_EAST_1"
  description = "Atlas Region"
}
variable "aws_region" {
  default     = "eu-west-1"
  description = "AWS Region"
}