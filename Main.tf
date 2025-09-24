resource "aws_instance" "EC2Instance" {
  ami           = "ami-08982f1c5bf93d976"
  instance_type = "t3.micro"

  tags = {
    Name = "EC2CLI"
    Provisionado = "Terraform" 
  }
}