
module "aks" {
  source  = "Azure/aks/azurerm"
  version = "7.5.0"

  resource_group_name                  = azurerm_resource_group.rg_aks.name
  location                             = var.azure_location
  cluster_name                         = "${var.tag_env}-${var.resource_name}-${var.app}-${random_id.rndm_name.hex}"
  prefix                               = random_id.rndm_name.hex
  kubernetes_version                   = var.kubernetes_version
  orchestrator_version                 = var.orchestrator_version
  cluster_log_analytics_workspace_name = "${var.tag_env}-${var.resource_name}-${var.app}-log"
  load_balancer_sku                    = var.load_balancer_sku
  network_plugin                       = var.network_plugin
  network_policy                       = var.network_plugin

  ## authentication and authorization 
  # rbac_aad_admin_group_object_ids = [data.azuread_group.admin-team.id]
  rbac_aad                          = false
  rbac_aad_managed                  = false
  rbac_aad_azure_rbac_enabled       = true
  role_based_access_control_enabled = false

  ## default node pool 
  agents_pool_name          = var.agents_pool_name
  agents_size               = var.agents_size
  agents_max_count          = var.agents_max_count
  agents_min_count          = var.agents_min_count
  agents_max_pods           = var.agents_max_pods
  agents_availability_zones = var.agents_availability_zones
  agents_type               = var.agents_type
  enable_auto_scaling       = true
  vnet_subnet_id            = data.azurerm_subnet.subnet_public.id
  agents_tags = {
    owner     = var.owner_team
    pool      = "agentpool"
    env       = var.tag_env
    terraform = "true"
  }

  net_profile_dns_service_ip = "10.0.0.10"
  net_profile_service_cidr   = "10.0.0.0/16"
  network_contributor_role_assigned_subnet_ids = {
    pub-subnet-1 = data.azurerm_subnet.subnet_public.id,
    pri-subnet-1 = data.azurerm_subnet.subnet_private.id
  }

  # node_pools = var.user_node_pools

  tags = {
    owner     = var.owner_team
    app       = var.app
    env       = var.tag_env
    terraform = "true"
  }
}
