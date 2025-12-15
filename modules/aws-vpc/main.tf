resource "aws_vpc" "this" {
cidr_block = var.cidr_block
}


resource "aws_subnet" "private" {
count = 2
vpc_id = aws_vpc.this.id
cidr_block = cidrsubnet(var.cidr_block, 8, count.index)
availability_zone = data.aws_availability_zones.available.names[count.index]
}


data "aws_availability_zones" "available" {}