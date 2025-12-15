module "aws_vpc" {
    source = "./modules/aws-vpc"
    cidr_block = "10.0.0.0/16"
}


module "eks" {
    source = "./modules/aws-eks"
    cluster_name = "${var.cluster_name}-eks"
    vpc_id = module.aws_vpc.vpc_id
    subnet_ids = module.aws_vpc.private_subnets
}


module "eks" {
    source = "./modules/aws-eks-observability"
    cluster_name = "${var.cluster_name_1}-eks"
    vpc_id = module.aws_vpc.vpc_id
    subnet_ids = module.aws_vpc.private_subnets
}


module "azure_vnet" {
    source = "./modules/azure-vnet"
    location = var.azure_location
    address_space = "10.10.0.0/16"
}


module "aks" {
    source = "./modules/azure-aks"
    cluster_name = "${var.cluster_name}-aks"
    location = var.azure_location
    subnet_id = module.azure_vnet.subnet_id
}