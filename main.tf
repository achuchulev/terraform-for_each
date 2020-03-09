resource "aws_s3_bucket" "b" {

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
