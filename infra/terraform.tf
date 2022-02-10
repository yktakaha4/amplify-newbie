terraform {
  backend "s3" {
    bucket = "yktakaha4-tsukuro-iac"
    region = "ap-northeast-1"
    key    = "tfstate/amplify-newbie/terraform.tfstate"
  }
}
