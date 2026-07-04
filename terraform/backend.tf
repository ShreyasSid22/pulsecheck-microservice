terraform {
  backend "s3" {
    bucket = "pulsecheck-terraform-state-038832651490"
    key    = "pulsecheck/terraform.tfstate"
    region = "ap-south-1"
  }
}
