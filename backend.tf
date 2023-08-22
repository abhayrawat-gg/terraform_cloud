terraform {
  cloud {
    organization = "abhay-example-org"

    workspaces {
      name = "abhay-example-workspace"
    }
  }
}

