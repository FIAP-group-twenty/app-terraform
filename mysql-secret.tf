resource "kubernetes_secret" "mysql_secret" {
  metadata {
    name = "mysql-secret"
  }

  data = {
    # SPRING_DATASOURCE_URL      = "amRiYzpteXNxbDovL215c3FsOjMzMDYvZmlhcC0wMQ=="
    # SPRING_DATASOURCE_USERNAME  = "cm9vdA=="
    MYSQL_ROOT_PASSWORD         = "YWRtaW4="
    SPRING_DATASOURCE_PASSWORD   = "YWRtaW4="
    SPRING_DATASOURCE_URL      = "jdbc:mysql://mysql:3306/fiap-01"
    SPRING_DATASOURCE_USERNAME  = "root"
    # MYSQL_ROOT_PASSWORD         = "admin"
    # SPRING_DATASOURCE_PASSWORD   = "admin"
  }
}
