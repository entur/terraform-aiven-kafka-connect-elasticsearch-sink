locals {
  standard_configuration = merge(
    var.init.default_configuration,
    {
      "name" : var.connector_name,
      "connector.class" : var.connector_class,
      "connection.url" : join(",", toset(var.connection_urls)),
      "connection.username" : var.connection_username,
      "connection.password" : var.connection_password,
      "topics" : join(",", toset(var.kafka_topics)),
      "type.name" : var.type_name,
      "value.converter.schema.registry.basic.auth.user.info" : "${data.aiven_kafka_user.kafka_user.username}:${data.aiven_kafka_user.kafka_user.password}"
    }
  )
}

data "aiven_kafka_user" "kafka_user" {
  project      = var.init.aiven.project
  service_name = var.init.aiven.service
  username     = var.kafka_username
}

resource "aiven_kafka_connector" "elasticsearch-sink-connector" {
  connector_name = var.connector_name
  project        = var.init.aiven.project
  service_name   = var.init.aiven.service
  config         = merge(local.standard_configuration, var.additional_configuration)
}
