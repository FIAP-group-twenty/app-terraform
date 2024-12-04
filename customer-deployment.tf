resource "kubernetes_deployment" "customer_deployment" {
  metadata {
    name = "customer-service"
    labels = {
      app = "customer-service"
    }
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "customer-service"
      }
    }

    template {
      metadata {
        labels = {
          app = "customer-service"
        }
      }

      spec {
        container {
          name  = "customer-service"
          image = "danilo766/techchallenge:3"

          port {
            container_port = 8080
          }

          env {
            name = "SPRING_DATASOURCE_URL"
            value_from {
              secret_key_ref {
                name = "customer-mysql-secret"
                key  = "SPRING_DATASOURCE_URL"
              }
            }
          }

          env {
            name = "SPRING_DATASOURCE_USERNAME"
            value_from {
              secret_key_ref {
                name = "customer-mysql-secret"
                key  = "SPRING_DATASOURCE_USERNAME"
              }
            }
          }

          env {
            name = "SPRING_DATASOURCE_PASSWORD"
            value_from {
              secret_key_ref {
                name = "customer-mysql-secret"
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
