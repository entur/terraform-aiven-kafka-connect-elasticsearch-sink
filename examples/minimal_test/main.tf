variable "api_token" {}

module "init" {
  # This is an example only; if you're adding this block to a live configuration,
  # make sure to use the latest release of the init module, found here:
  # https://github.com/entur/terraform-aiven-kafka-connect-init/releases
  source       = "github.com/entur/terraform-aiven-kafka-connect-init//modules/init?ref=v1.1.2"
  access_token = var.api_token
  project_name = "my-aiven-project"
  service_name = "my-aiven-kafka-connect-service-name"
}


module "elasticsearch-sink" {
  # This is an example only; if you're adding this block to a live configuration,
  # make sure to use the latest release of the init module, found here:
  # https://github.com/entur/terraform-aiven-kafka-connect-elasticsearch-sink/releases
  source              = "../../modules/elasticsearch-sink"
  init                = module.init
  connector_name      = "my-elasticsearch-sink-connector"
  connection_urls     = ["my-es-url1", "my-es-url2"]
  connection_username = "my-es-username"
  connection_password = "my-es-password"
  kafka_topics        = ["my-topic-1", "my-topic-2"]
  additional_configuration = {
    "type.name" : "_doc",
    "key.ignore" : "false",
    "schema.ignore" : "true",
    "transforms" : "extractFieldKey,valueToKey",
    "transforms.extractFieldKey.type" : "org.apache.kafka.connect.transforms.ExtractField$Key",
    "transforms.extractFieldKey.field" : "id",
    "transforms.valueToKey.type" : "org.apache.kafka.connect.transforms.ValueToKey",
    "transforms.valueToKey.fields" : "id"
  }
}
