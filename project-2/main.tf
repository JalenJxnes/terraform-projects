# Create S3 bucket
resource "aws_s3_bucket" "terraform-bucket" {
  bucket = "jalen-jones-test-terraform-state"

  tags = {
    Name        = "terraform state bucket"
    Environment = "Dev"
  }
}