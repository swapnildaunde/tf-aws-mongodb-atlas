locals {
    # get json 
    service_data = jsondecode(file("${path.module}/templates/service.json"))
    service_configuration = local.service_data.service_configuration
    #all_service_users = [for service in local.service_data.service_configuration : service.serviceName]
}

