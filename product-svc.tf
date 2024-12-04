resource "kubernetes_service" "product_service" {
  metadata {
    name = "product-service"
  }

  spec {
    selector = {
      app = kubernetes_deployment.product_deployment.metadata[0].labels["app"]
    }

    port {
      port       = 8080
      node_port  = 30005
    }

    type = "NodePort"
  }
}
