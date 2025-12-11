resource "aws_launch_template" "Frontend_LT" {
    name = var.Frontend_LT_name
    update_default_version = var.LT_version
    image_id = var.ami_id
    instance_type = var.LT_instance_type
    key_name = var.key_pair_name
    vpc_security_group_ids = [var.Frontend_LT_SG]
    user_data = base64encode(file("${path.module}/pub_userdata.sh"))

    tag_specifications {
      resource_type = var.LT_resource_type
      tags = {
        Name = var.Frontend_ec2_name
      }
    }
}

resource "aws_launch_template" "Backend_LT" {
    name = var.Backend_LT_name
    update_default_version = var.LT_version
    instance_type = var.LT_instance_type
    key_name = var.key_pair_name
    image_id = var.ami_id
    vpc_security_group_ids = [var.Backend_LT_SG]
    user_data = base64encode(file("${path.module}/pvt_userdata.sh"))

    tag_specifications {
      resource_type = var.LT_resource_type
      tags = {
        Name = var.Backend_ec2_name
      }
    }  
}