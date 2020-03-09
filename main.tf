# Usage with a map
resource "aws_s3_bucket" "new_bucket" {

  for_each = {
    my-tf-test-bucket = "Test"
    my-tf-dev-bucket  = "Dev"
    my-tf-prod-bucket = "Prod"
  }
  
  bucket = each.key
  acl    = "private"

  tags = {
    Environment = each.value
  }
}

# Usage with a set of strings

variable "subnet_ids" {
  type = list(string)
}

resource "aws_instance" "server" {
  for_each = toset(var.subnet_ids)

  ami           = "ami-0400a1104d5b9caa1"
  instance_type = "t2.micro"
  subnet_id     = each.key # note: each.key and each.value are the same for a set

  tags = {
    Range = "Server IP within ${each.key} subnet"
  }
}
