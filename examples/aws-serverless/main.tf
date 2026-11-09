module "bucket" {
  source = "../../modules/aws/s3-bucket"
  name   = "example-public-data"
  tags   = { purpose = "example" }
}

output "bucket_arn" {
  value = module.bucket.bucket_arn
}
