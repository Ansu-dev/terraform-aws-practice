/* ec2_instance
name : aws-learner-ec2-instance
ami : ami-02288bc8778f3166f
type : t2.micro
keypair : Ansu-Dev
security group : 보안그룹 추가, ssh22, http 80 */


resource "aws_security_group" "aws_learner_security_group" {
  name = "aws_learner_security_group"

  # SSH (Port 22) 인바운드 규칙 추가
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # HTTP (Port 80) 인바운드 규칙 추가
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


resource "aws_instance" "ec2_instance" {
  ami           = "ami-02288bc8778f3166f"
  instance_type = "t2.micro"
  key_name      = var.key_pair

  vpc_security_group_ids = [aws_security_group.aws_learner_security_group.id]

  tags = {
    Name = "aws-learner-ec2-instance"
  }
}