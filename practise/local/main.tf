terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "2.6.1"
    }
  }
}

provider "local" {
  # Configuration options
}

resource "local_file" "this" {
  filename        = var.filename
  content         = "console.log('Hello_World');"
  file_permission = "0766"
  depends_on = [ local_file.this1 ]

  lifecycle {
    prevent_destroy = false
  }
}


resource "local_file" "this1" {
  filename = "index.js"
  content = "console.log('byeee');"
  file_permission = "0777"
}