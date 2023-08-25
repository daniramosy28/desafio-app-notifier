terraform {
      backend "s3" {
    bucket         = "tf-notifier-state-v1"
    key            = "terraform.tfstate"
    dynamodb_table = "tf-notifier-state-v1"
    region         = "us-east-1"
    profile        = "fiap"
  }
}