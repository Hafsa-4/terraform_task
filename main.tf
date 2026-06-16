resource "aws_s3_bucket" "demo" {
  bucket = "hafsa-terraform-task-demo-2026"

  tags = {
    Name        = "terraform-task-demo"
    Environment = "dev"
    Owner       = "Hafsa"

  }
}
#end of code
#trigger test
