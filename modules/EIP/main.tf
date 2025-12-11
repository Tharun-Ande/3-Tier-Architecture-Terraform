resource "aws_eip" "EIP" {

    tags = {
      Name = var.eip_name
    }
     
}