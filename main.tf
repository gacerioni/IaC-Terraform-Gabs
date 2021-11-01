terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.0.0"
    }
  }
}
provider "kubernetes" {
}
resource "kubernetes_namespace" "test" {
  metadata {
    name = "nginx"
  }
}
