data "terraform_remote_state" "eu-site-1-net" {
  backend = "s3"
  config {
    bucket = "your-account-eu-site-1-net"
    key    = "eu-site-1-net"
    region = "eu-west-2"
  }
}

resource "aws_key_pair" "web-layer" {
  key_name   = "web-layer"
  public_key = "${file("~/.ssh/id_rsa.pub")}"
}

data "aws_ami" "ubuntu" {
  most_recent = true
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-trusty-14.04-amd64-server-*"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  owners = ["099720109477"] # Canonical
}

resource "aws_network_interface" "nginx-net-iface" {
  subnet_id = "${data.terraform_remote_state.eu-site-1-net.public_subnet_id}"
  private_ips = ["10.1.1.12"]
  security_groups = ["${data.terraform_remote_state.eu-site-1-net.web_sg_id}"]
  tags {
    Name = "nginx-net-iface"
  }
}

resource "aws_instance" "nginx" {
  provisioner "remote-exec" {
    inline = [
      "sudo apt update",
      "sudo apt install -y nginx",
    ]
    connection {
      type     = "ssh"
      private_key = "${file("~/.ssh/id_rsa")}"
      user     = "ubuntu"
      timeout  = "5m"
    }
  }
    key_name = "web-layer"
    ami = "${data.aws_ami.ubuntu.id}"
    instance_type = "t2.micro"

    network_interface {
     network_interface_id = "${aws_network_interface.nginx-net-iface.id}"
     device_index = 0
  }
}