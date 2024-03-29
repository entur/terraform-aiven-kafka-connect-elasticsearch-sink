variable "my_aiven_access_token" {}

module "init" {
  # This is an example only; if you're adding this block to a live configuration,
  # make sure to use the latest release of the init module, found here:
  # https://github.com/entur/terraform-aiven-kafka-connect-init/releases
  source               = "github.com/entur/terraform-aiven-kafka-connect-init//modules/init?ref=v1.1.5"
  access_token         = var.my_aiven_access_token
  project_name         = "my-aiven-project-name"
  kafka_service_name   = "my-aiven-kafka-service-name"
  connect_service_name = "my-aiven-kafka-connect-service-name"
}

# ci: x-release-please-start-version

module "elasticsearch-sink" {
  source              = "github.com/entur/terraform-aiven-kafka-connect-elasticsearch-sink//modules/elasticsearch-sink?ref=v0.1.3"
  init                = module.init
  connector_name      = "my-elasticsearch-sink-connector"
  connection_urls     = ["my-es-url1", "my-es-url2"]
  connection_username = "my-es-sink-username"
  connection_password = "my-es-sink-password"
  kafka_username      = "my-kafka-username"
  kafka_topics        = ["my-topic-1", "my-topic-2"]
  additional_configuration = {
    "type.name" : "_doc",
    "key.ignore" : "false",
    "schema.ignore" : "true"
  }
}

# ci: x-release-please-end