resource "kubernetes_deployment" "mysql_deployment" {
  metadata {
    name = "mysql"
    labels = {
      app = "mysql"
    }
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "mysql"
      }
    }

    template {
      metadata {
        labels = {
          app = "mysql"
        }
      }

      spec {
        container {
          name  = "mysql"
          image = "mysql:latest"

          env {
            name = "MYSQL_ROOT_PASSWORD"
            value_from {
              secret_key_ref {
                name = "mysql-secret"
                key  = "MYSQL_ROOT_PASSWORD"
              }
            }
          }

          env {
            name = "MYSQL_DATABASE"
            value = "fiap-01"
          }

          port {
            container_port = 3306
          }

          readiness_probe {
            exec {
              command = [
                "sh",
                "-c",
                "mysqladmin ping -h localhost -uroot -p$MYSQL_ROOT_PASSWORD"
              ]
            }
            initial_delay_seconds = 20
            period_seconds = 10
          }

          liveness_probe {
            exec {
              command = [
                "sh",
                "-c",
                "mysqladmin ping -h localhost -uroot -p$MYSQL_ROOT_PASSWORD"
              ]
            }
            initial_delay_seconds = 30
            period_seconds = 10
          }

          volume_mount {
            name      = "mysql-storage"
            mount_path = "/var/lib/mysql"
          }
        }

        volume {
          name = "mysql-storage"
          persistent_volume_claim {
            claim_name = "mysql-pvc"
          }
        }
      }
    }
  }
}
