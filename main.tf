
variable "s3_bucket_name" {
  description = "s3 bucket name"
  type        = string
  default     = "demo_bucket"
}

variable "region" {
  description = "aws region"
  type        = string
  default     = "us-east-1"
}

resource "aws_iam_policy" "policy" {
  name        = "test_policy"
  path        = "/"
  description = "My test policy"

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "ec2:Describe*",
        ]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}



resource "aws_s3_bucket" "b" {
  bucket = "my-tf-test-bucket"
  acl    = "private"
}

output "render_policy_file" {
  value = templatefile("${path.module}/policies/policy.json", { bucket_name = var.s3_bucket_name})
}
