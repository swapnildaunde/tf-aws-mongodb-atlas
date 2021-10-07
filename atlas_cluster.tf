resource "mongodbatlas_cluster" "cluster_atlas" {
  project_id                   = var.atlasprojectid
  name                         = var.cluster_name
  cloud_backup                 = true
  auto_scaling_disk_gb_enabled = true
  mongo_db_major_version       = "4.4"
  cluster_type                 = "REPLICASET"
  replication_specs {
    num_shards = 1
    regions_config {
      region_name     = var.atlas_region
      electable_nodes = 3
      priority        = 7
      read_only_nodes = 0
    }
  }
  # Provider settings
  provider_name               = "AWS"
  disk_size_gb                = 10
  provider_instance_size_name = "M10"
}

data "mongodbatlas_cluster" "cluster_atlas" {
  project_id = var.atlasprojectid
  name       = mongodbatlas_cluster.cluster_atlas.name
  depends_on = [mongodbatlas_privatelink_endpoint_service.atlaseplink]
}

output "atlasclusterstring" {
  value = data.mongodbatlas_cluster.cluster_atlas.connection_strings
}
output "plstring" {
  value = lookup(data.mongodbatlas_cluster.cluster_atlas.connection_strings[0].aws_private_link_srv, aws_vpc_endpoint.ptfe_service.id)
}

