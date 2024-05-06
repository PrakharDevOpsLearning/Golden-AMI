terraform {
  backend "s3" {
    bucket = "expensestatefile"
    key    = "ami/state"
    region = "us-east-1"
  }
}
