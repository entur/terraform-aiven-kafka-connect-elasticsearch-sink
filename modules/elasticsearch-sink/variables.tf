variable "init" {
  description = "Entur init module output. https://github.com/entur/terraform-aiven-kafka-connect-init"
  type = object({
    aiven = object({
      project      = string
      service      = string
      access_token = string
    })
    schema_registry = object({
      url      = string
      userinfo = string
    })
    default_configuration = map(string)
  })
}

variable "connector_name" {
  type        = string
  description = "Unique name for this connector in the connect cluster"
}

variable "connector_class" {
  type        = string
  description = "Name or alias of the class for this connector"
  default     = "io.aiven.connect.elasticsearch.ElasticsearchSinkConnector"
}

variable "connection_urls" {
  type        = list(string)
  description = "List of Elasticsearch HTTP connection URLs"
}

variable "connection_username" {
  type        = string
  description = "The username used for authentication against Elasticsearch service"
}

variable "connection_password" {
  type        = string
  description = "The password used for authentication against Elasticsearch service"
}

variable "kafka_topics" {
  type        = list(string)
  description = "List of kafka topic names to sink data from"
}

variable "type_name" {
  type        = string
  description = "The Elasticsearch type name to use when indexing"
  default     = "_doc"
}

variable "additional_configuration" {
  type        = map(string)
  default     = {}
  description = "Add additional configuration options as a map"
}
