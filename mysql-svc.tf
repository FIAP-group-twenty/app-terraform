resource "kubernetes_service" "mysql_svc" {
  metadata {
    name = "mysql"
  }

  spec {
    type = "ClusterIP"

    port {
      port        = 3306
      target_port = 3306
    }

    selector = {
      app = "mysql"
    }
  }
}
