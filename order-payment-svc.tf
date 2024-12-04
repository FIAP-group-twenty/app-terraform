resource "kubernetes_service" "order-payment_service" {
  metadata {
    name = "order-payment-service"
  }

  spec {
    selector = {
      app = kubernetes_deployment.order-payment_deployment.metadata[0].labels["app"]
    }

    port {
      port       = 8080
      node_port  = 30004
    }

    type = "NodePort"
  }
}
