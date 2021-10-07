# DATABASE USER
resource "random_password" "password" {
  length           = 8
  special          = true
  override_special = "_%@"
}
resource "mongodbatlas_database_user" "users" {
  for_each = { for x in local.service_configuration: x.serviceName => x }
  username           = each.value.serviceName
  password           = random_password.password.result
  project_id         = var.atlasprojectid
  auth_database_name = each.value.mongoDatabase

  dynamic roles {
    for_each = {
      for role in toset(each.value.mongoCollection) : "${each.value.mongoCollection}-" => role
    }
    content {
      collection_name = roles.value
      role_name     = "read"
      database_name = each.value.mongoDatabase
    }
  }

  labels {
    key   = "Name"
    value = each.value.serviceName
  }

  scopes {
    name = each.value.mongoCluster
    type = "CLUSTER"
  }
}
output "user1" {
  value = mongodbatlas_database_user.users
  sensitive = true
}
