terraform {
      backend "s3" {
    bucket         = "tf-notifier-state-desafio"
    key            = "path/to/terraform.tfstate"
    dynamodb_table = "tf-notifier-state-desafio"
    region         = "us-east-1"
    profile        = "fiap"
  }
}