resource "kubernetes_service" "customer_service" {
  metadata {
    name = "customer-service"
  }

  spec {
    selector = {
      app = kubernetes_deployment.customer_deployment.metadata[0].labels["app"]
    }

    port {
      port       = 8080
      node_port  = 30002
    }

    type = "NodePort"
  }
}
