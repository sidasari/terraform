data "aws_ami" "my_ami" {
     most_recent      = true
     #name_regex       = "^mavrick"
     owners           = ["721834156908"]
}


resource "aws_instance" "web-1" {
    count = 3
    ami = "${data.aws_ami.my_ami.id}"
    availability_zone = "us-east-1a"
    instance_type = "t2.micro"
    key_name = "LaptopKey"
    subnet_id = "${aws_subnet.subnet1-public.id}"
    vpc_security_group_ids = ["${aws_security_group.allow_all.id}"]
    associate_public_ip_address = true	
    tags = {
        Name = "Server-${count.index+1}"
        Env = "Prod"
        Owner = "Sree"
	    CostCenter = "ABCD"
    }
}