provider "aws"{
    region = "us-east-1"
}

variable "vpcname" {
    type = string
    default = "myvpc"
}

variable "sshport" {
    type = number
    default = 22
}

variable "enabled" {
    default = true
}

variable "mylist" {
    type = list(string)
    default = [ "Value1", "Value2" ]
}   

variable "mymap" {
    type = map
    default = {
        key1 = "value1"
        key2 = "value2"
    }   
}

variable "inputname" {
    type = string
    description = "Set the tag name of the vpc"
}

resource "aws_vpc" "my-vpc" {
    cidr_block = "10.0.0.0/16"
    tags = {
        Name = var.inputname
    }
}

output "amyoutput" {
    value = aws_vpc.my-vpc
}
