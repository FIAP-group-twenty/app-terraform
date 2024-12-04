resource "kubernetes_deployment" "order-payment_deployment" {
  metadata {
    name = "order-payment-service"
    labels = {
      app = "order-payment-service"
    }
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "order-payment-service"
      }
    }

    template {
      metadata {
        labels = {
          app = "order-payment-service"
        }
      }

      spec {
        container {
          name  = "order-payment-service"
          image = "danilo766/techchallenge:3"

          port {
            container_port = 8080
          }

          env {
            name = "SPRING_DATASOURCE_URL"
            value_from {
              secret_key_ref {
                name = "order-payment-mysql-secret"
                key  = "SPRING_DATASOURCE_URL"
              }
            }
          }

          env {
            name = "SPRING_DATASOURCE_USERNAME"
            value_from {
              secret_key_ref {
                name = "order-payment-mysql-secret"
                key  = "SPRING_DATASOURCE_USERNAME"
              }
            }
          }

          env {
            name = "SPRING_DATASOURCE_PASSWORD"
            value_from {
              secret_key_ref {
                name = "order-payment-mysql-secret"
                key  = "SPRING_DATASOURCE_PASSWORD"
              }
            }
          }

          resources {
            limits = {
              cpu    = "1"
              memory = "1Gi"
            }
            requests = {
              cpu    = "250m"
              memory = "512Mi"
            }
          }
        }
      }
    }
  }
}
