module "vpc" {
    source = "./modules/vpc"
    vpc_cidr_block = var.vpc_cidr_block
    vpc_instance_tenancy = var.vpc_instance_tenancy
    vpc_name = var.vpc_name
}

module "subnets" {
    source = "./modules/subnets"
    vpc_id = module.vpc.vpc_id
    pub_sub_cidr = var.pub_sub_cidr
    pub_sub_names = var.pub_sub_names
    pvt_sub_cidr = var.pvt_sub_cidr
    pvt_sub_names = var.pvt_sub_names
    pvt_DB_sub_cidr = var.pvt_DB_sub_cidr
    pvt_DB_sub_names = var.pvt_DB_sub_names
    pvt_DB_azs = var.pvt_DB_azs
    pub_azs = var.pub_azs
    pvt_azs = var.pvt_azs
    map_public_ip_on_launch = var.map_public_ip_on_launch
}

module "IGW" {
    source = "./modules/IGW"
    vpc_id = module.vpc.vpc_id
    igw_name = var.igw_name 
}

module "EIP" {
    source = "./modules/EIP"
    eip_name = var.eip_name 
}

module "NAT" {
    source = "./modules/NAT"
    eip_id = module.EIP.eip_id
    pub_sub = module.subnets.pub_sub_id[0]
    NAT_name = var.NAT_name  
}

module "Route_Table" {
    source = "./modules/RT"
    vpc_id = module.vpc.vpc_id
    rt_cidr = var.rt_cidr
    igw_id = module.IGW.IGW_id
    pub_rt_name = var.pub_rt_name
    pub_subnets = module.subnets.pub_sub_id
    nat_id = module.NAT.NAT_id
    pvt_rt_name = var.pvt_rt_name
    pvt_subnets = module.subnets.pvt_sub_id  
}

module "SG" {
    source = "./modules/SG"
    vpc_id = module.vpc.vpc_id
    ALB_sg_name = var.ALB_sg_name
    Frontend_sg_name = var.Frontend_sg_name
    ILB_sg_name = var.ILB_sg_name
    Backend_sg_name = var.Backend_sg_name
    DB_sg_name = var.DB_sg_name 
}

module "key-pair" {
    source = "./modules/KEY-PAIR"
    key_pair_name = var.key_pair_name
    public_key = var.public_key
}

module "ALB" {
    source = "./modules/ALB"
    ALB_name = var.ALB_name
    ALB_internal = var.ALB_internal
    ALB_load_balancer_type = var.ALB_load_balancer_type
    ALB_SG = module.SG.ALB_SG
    ALB_action_type = var.ALB_action_type
    ALB_TG_name = var.ALB_TG_name
    ALB_TG_path = var.ALB_TG_path
    ALB_TG_port = var.ALB_TG_port
    ALB_TG_protocol = var.ALB_TG_protocol
    ALB_TG_target_type = var.ALB_TG_target_type
    vpc_id = module.vpc.vpc_id
    pub_subnets = module.subnets.pub_sub_id
}

module "ILB" {
    source = "./modules/ILB"
    vpc_id = module.vpc.vpc_id
    load_balancer_type = var.load_balancer_type
     pvt_subnets = module.subnets.pvt_sub_id
    ILB_name = var.ILB_name
    ILB_action_type = var.ILB_action_type
    ILB_internal = var.ILB_internal
    ILB_path = var.ILB_path
    ILB_port = var.ILB_port
    ILB_protocol = var.ILB_protocol
    ILB_SG = module.SG.ILB_SG
    ILB_target_type = var.ILB_target_type
    ILB_TG_name = var.ILB_TG_name    
}

module "LT" {
    source = "./modules/LT"
    Frontend_LT_name = var.Frontend_LT_name
    Frontend_ec2_name = var.Frontend_ec2_name
    LT_version = var.LT_version
    ami_id = var.ami_id
    LT_instance_type = var.LT_instance_type
    LT_resource_type = var.LT_resource_type
    key_pair_name = module.key-pair.key_pair
    Frontend_LT_SG = module.SG.Frontend_SG
    Backend_LT_name = var.Backend_LT_name
    Backend_ec2_name = var.Backend_ec2_name
    Backend_LT_SG = module.SG.Backend_SG
}

module "ASG" {
    source = "./modules/ASG"
    Frontend_ASG_name = var.Frontend_ASG_name
    min_size = var.min_size
    max_size = var.max_size
    desired_capacity = var.desired_capacity
    pub_subnets = module.subnets.pub_sub_id
    pvt_subnets = module.subnets.pvt_sub_id
    health_check_type = var.health_check_type
    Frontend_LT_id = module.LT.Frontend_LT
    Backend_LT_id = module.LT.Backend_LT
    Frontend_TG_arn = module.ALB.ALB_TG_arn
    Backend_TG_arn = module.ILB.ILB_TG_arn
    Backend_ASG_name = var.Backend_ASG_name
    ASG_version = var.ASG_version   
}

module "RDS" {
    source = "./modules/RDS"
    db_subnet_group_name = var.db_subnet_group_name
    pvt_db_subnets = module.subnets.pvt_DB_sub_id
    rds_identifier = var.rds_identifier
    rds_allocated_storage = var.rds_allocated_storage
    rds_engine = var.rds_engine
    rds_engine_version = var.rds_engine_version
    rds_instance_class = var.rds_instance_class
    rds_multi_az = var.rds_multi_az
    rds_sg = module.SG.DB_SG
    rds_publicly_accessible = var.rds_publicly_accessible
    rds_skip_final_snapshot = var.rds_skip_final_snapshot
    rds_storage_type = var.rds_storage_type
    username = var.username
    password = var.password
    db_name = var.db_name
}