# vpc values

vpc_name = "harshith"
vpc_cidr_block = "10.0.0.0/16"
vpc_instance_tenancy = "default"

# subnet values

pub_sub_names = ["pub-1", "pub-2"]
pub_sub_cidr = ["10.0.1.0/24", "10.0.2.0/24"]
pvt_sub_names = ["pvt-1", "pvt-2"]
pvt_sub_cidr = ["10.0.3.0/24", "10.0.4.0/24"]
pub_azs = ["ap-south-1a", "ap-south-1b"]
pvt_azs = ["ap-south-1a", "ap-south-1b"]
pvt_DB_sub_cidr = [ "10.0.5.0/24", "10.0.6.0/24" ]
pvt_DB_sub_names = [ "pvt-DB-1", "pvt-DB-2" ]
pvt_DB_azs = [ "ap-south-1a", "ap-south-1b" ]
map_public_ip_on_launch = true

# IGW values

igw_name = "IGW"

# EIP values

eip_name = "EIP"

# NAT values

NAT_name = "NAT"

# RT values

pub_rt_name = "PUB_RT"
pvt_rt_name = "PVT_RT"
rt_cidr = "0.0.0.0/0"

# SG values

ALB_sg_name = "ALB_SG"
Frontend_sg_name = "Frontend_SG"
ILB_sg_name = "ILB_SG"
Backend_sg_name = "Backend_SG"
DB_sg_name = "DB_SG"

# Key Pair values

key_pair_name = "KEY_PAIR"
public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQL7rPVMRSjq/GE69t83hgbMYDXpPw/hXvxexZlfyErcvaOlLOkP0D3c40Rgx5WiVhqLT/tyjLRjvq/l4SLOtxF6ykaUkJUb/DOg8VTuT02qlX0Nb/fLs4/LKA0TPFtXqiiDkHpr3S7/zR98fwPEwV5CJrH0fIgfg8IeGItOuelpryRbuSILN44fcrWp5fq+OKNBgNZC+xWCT01dAiin5W7fGQ5l7uP5JxsPe7hGrrr8HA7E5jRxm4P1ISX1c7dkxoT4slo0EY3IiVWNLOfZ4w8I2w3cOEEVdZ04vsOyTquXgSijxbn3ZxiGwJccU6rvD5eAY+6+SK1gwZRcARM20CIovihp/l5rf1gXe8mprEaAJtemu6G2bn/RoGYLWSLrJtTP9gvO7TV3LbpAGqtZkZ2zJEY1ayeccbn5xFd+Q5D7iCi56E+uchg3Qr0vHeTl4T3OrvMDTtFsP390b/j4BO/lYL6esQdu0s9Ch00Hn89lQvKvNRMLWgJ0oGN5rYgzOXEFdgYlEl3rke5F9s9+M6d7p3BrvmwvnjL74B69ZZs2j7vWayyKpSwCNH2fhNa7UkpP3ozLg/ePgX/AypJeRIAb/MGeixtTCW9XFY0RAlYhHBUuDp9qs31qbiMbmLo+6RWaFOsc6jmiqCG9Lf4rGS5vF97oN0YCZiLY+OlMuKhB7w== harshith reddy@DESKTOP-JIKU976"


# ALB values

ALB_name = "ALB"
ALB_internal = false
ALB_load_balancer_type = "application"
ALB_TG_name = "ALB-TG"
ALB_TG_path = "/health"
ALB_TG_port = 80
ALB_TG_protocol = "HTTP"
ALB_TG_target_type = "instance"
ALB_action_type = "forward"

# ILB values

ILB_name = "ILB"
ILB_action_type = "forward"
ILB_internal = true
ILB_path = "/health"
ILB_port = 3000
ILB_protocol = "HTTP"
ILB_target_type = "instance"
ILB_TG_name = "ILB-TG"
load_balancer_type = "application"


# LT values

Frontend_LT_name = "Frontend_LT"
Frontend_ec2_name = "Frontend"
LT_version = true
LT_instance_type = "t2.micro"
LT_resource_type = "instance"
ami_id = "ami-02b8269d5e85954ef"
Backend_LT_name = "Backend-LT"
Backend_ec2_name = "Backend"


#ASG values

Frontend_ASG_name = "Frontend-ASG"
min_size = 2
max_size = 3
desired_capacity = 2
health_check_type = "ELB"
ASG_version = "$Latest"
Backend_ASG_name = "Backend-ASG"

# DB values

rds_identifier = "harshith-db"
rds_engine = "mysql"
rds_engine_version = "8.0"
rds_allocated_storage = 20
rds_instance_class = "db.t3.micro"
rds_multi_az = false
rds_skip_final_snapshot = true
rds_storage_type = "gp3"
db_name = "harshith"
username = "admin"
password = "admin123"
db_subnet_group_name = "subnet-group"
rds_publicly_accessible = false
