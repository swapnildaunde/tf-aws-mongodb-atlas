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
