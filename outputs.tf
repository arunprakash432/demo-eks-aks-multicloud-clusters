output "eks_cluster" {
value = module.eks.cluster_name
}


output "aks_cluster" {
value = module.aks.cluster_name
}