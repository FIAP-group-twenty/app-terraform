resource "kubernetes_secret" "customer_mysql_secret" {
  metadata {
    name = "customer-mysql-secret"
  }

  data = {
    # SPRING_DATASOURCE_URL      = "amRiYzpteXNxbDovL215c3FsOjMzMDYvZmlhcC0wMQ=="
    # SPRING_DATASOURCE_USERNAME  = "cm9vdA=="
    MYSQL_ROOT_PASSWORD         = "admin12345678"
    SPRING_DATASOURCE_PASSWORD   = "admin12345678"
    SPRING_DATASOURCE_URL      = "jdbc:mysql://client-db.cpuy8crp9yqu.us-east-1.rds.amazonaws.com:3306/client_db"
    SPRING_DATASOURCE_USERNAME  = "admin"
    # MYSQL_ROOT_PASSWORD         = "admin"
    # SPRING_DATASOURCE_PASSWORD   = "admin"
  }
}
