# Usage

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=0.13.2 |
| <a name="requirement_aiven"></a> [aiven](#requirement\_aiven) | >= 3.0.0, < 4.0.0 |
| <a name="requirement_google"></a> [google](#requirement\_google) | >=4.40.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aiven"></a> [aiven](#provider\_aiven) | >= 3.0.0, < 4.0.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aiven_kafka_connector.elasticsearch-sink-connector](https://registry.terraform.io/providers/aiven/aiven/latest/docs/resources/kafka_connector) | resource |
| [aiven_kafka_user.kafka_user](https://registry.terraform.io/providers/aiven/aiven/latest/docs/data-sources/kafka_user) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_additional_configuration"></a> [additional\_configuration](#input\_additional\_configuration) | Add additional configuration options as a map | `map(string)` | `{}` | no |
| <a name="input_connection_password"></a> [connection\_password](#input\_connection\_password) | The password used for authentication against Elasticsearch service | `string` | n/a | yes |
| <a name="input_connection_urls"></a> [connection\_urls](#input\_connection\_urls) | List of Elasticsearch HTTP connection URLs | `list(string)` | n/a | yes |
| <a name="input_connection_username"></a> [connection\_username](#input\_connection\_username) | The username used for authentication against Elasticsearch service | `string` | n/a | yes |
| <a name="input_connector_class"></a> [connector\_class](#input\_connector\_class) | Name or alias of the class for this connector | `string` | `"io.aiven.connect.elasticsearch.ElasticsearchSinkConnector"` | no |
| <a name="input_connector_name"></a> [connector\_name](#input\_connector\_name) | Unique name for this connector in the connect cluster | `string` | n/a | yes |
| <a name="input_init"></a> [init](#input\_init) | Entur init module output. https://github.com/entur/terraform-aiven-kafka-connect-init | <pre>object({<br>    aiven = object({<br>      access_token         = string<br>      project              = string<br>      kafka_service_name   = string<br>      connect_service_name = string<br>      schema_registry_url  = string<br>    })<br>    default_configuration = map(string)<br>  })</pre> | n/a | yes |
| <a name="input_kafka_topics"></a> [kafka\_topics](#input\_kafka\_topics) | List of kafka topic names to sink data from | `list(string)` | n/a | yes |
| <a name="input_kafka_username"></a> [kafka\_username](#input\_kafka\_username) | Aiven service registry username to connect to Kafka schema registry | `string` | n/a | yes |
| <a name="input_type_name"></a> [type\_name](#input\_type\_name) | The Elasticsearch type name to use when indexing | `string` | `"_doc"` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
