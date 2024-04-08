# Dev AKS

## Global Parameters
azure_location             = "eastus"
resource_type              = "aks"
location_prefix            = "eus"

## Tags Parameters
tag_env                    = "dev"
app                        = "test"
origin                     = "terraform"
owner_team                 = "devops"

## Cluster Parameters
vnet_name                  = "vnet-dev-test-eus-e226"
resource_group_vnet        = "rg-dev-eus-e226"
kubernetes_version         = "1.27"
orchestrator_version       = "1.27"
load_balancer_sku          = "standard"
network_plugin             = "azure" # azurecni and kubenet
network_policy             = "azure" # "azure" network policy and calico

## Agent Pool Config
agents_pool_name           = "agentpool"
agents_size                = "Standard_B2s"
agents_max_count           = 2
agents_min_count           = 1
agents_max_pods            = 100
agents_availability_zones  = ["1", "2", "3"]

# user_node_pools = {
#   pool1 = {
#     vm_size             = "Standard_DS2_v2"
#     node_count          = 3
#     enable_auto_scaling = true
#     min_count           = 1
#     max_count           = 5
#   }
# }

