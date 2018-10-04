# Configure the MySQL provider
provider "mysql" {
  endpoint = "${var.container_ip}:3306"
  username = "root"
  password = "shaiMySQL"
}

# Create a Database
resource "mysql_database" "app" {
  count = "${length(var.databases_names)}"
  name = "${var.databases_names[count.index]}"
}
