# Configure the MySQL provider
provider "mysql" {
  endpoint = "${var.container_ip}:3306"
  username = "root"
  password = "shaiMySQL"
}

# Create a Database
resource "mysql_database" "databases" {
  count = "${length(var.databases_names)}"
  name = "${var.databases_names[count.index]}"
}

resource "mysql_user" "users" {
  count = "${length(keys(var.usernames_passwords))}"
  plaintext_password =  "${var.usernames_passwords[element(keys(var.usernames_passwords), count.index)]}"
  host               = "%"
  user = "${element(keys(var.usernames_passwords), count.index)}"
}

resource "mysql_grant" "grant_select" {
  count = "${length(keys(var.usernames_passwords)) * length(var.databases_names)}"
  user       = "${element(keys(var.usernames_passwords), count.index % length(keys(var.usernames_passwords)))}"
  host       = "%"
  database   = "${var.databases_names[count.index % length(var.databases_names)]}"
  privileges = ["SELECT"]
}
