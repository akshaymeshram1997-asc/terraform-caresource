terraform {
  backend "remote" {
    organization = "CareSourceIT"

    workspaces {
      name = "eqe-automationeng-int"
    }
  }
}
