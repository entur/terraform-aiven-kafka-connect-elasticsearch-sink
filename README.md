# Elasticsearch sink connector

Terraform module for managing Elasticsearch sink connector on Aiven managed KafkaConnect cluster
This module depends on [Aiven kafka init module](https://github.com/entur/terraform-aiven-kafka-connect-init) to access
basic information about Aiven's KafkaConnect clusters

[Module](modules/elasticsearch-sink)

[Example](examples/minimal/main.tf)

## Getting started

Access to Aiven terraform provider requires an API authentication token which can be generated
from [Aiven console](https://console.gcp.aiven.io/profile/auth)
Aiven authentication token can be provided as an environment variable with `TF_VAR_` prefix or in a `.tfvars` file,
otherwise from Harness Secrets Manager if you are provisioning from Harness.

### Elasticsearch connector configuration

To be able to sink data to Elasticsearch server you need to figure out

- the topics on the Kafka cluster to sink data from
- the target Elasticsearch service URL(s)
- credentials(username and password) to get access to the Elasticsearch service

<!-- ci: x-release-please-start-version -->

### Example using the latest release

```
module "elasticsearch-sink" {
  source = "github.com/entur/terraform-aiven-kafka-connect-elasticsearch-sink//modules/elasticsearch-sink?ref=v0.0.0"
  ...
}
```

<!-- ci: x-release-please-end -->

See the `README.md` under each module's subfolder for a list of supported inputs and outputs. For examples showing how
they're implemented, check the [examples](examples) subfolder.

### Version constraints

You can control the version of a module dependency by adding `?ref=TAG` at the end of the source argument, as shown in
the example above. This is highly recommended. You can find a list of available
versions [here](https://github.com/entur/terraform-aiven-kafka-connect-elasticsearch-sink/releases).

Dependency automation tools such as Renovate Bot will be able to discover new releases and suggest updates
automatically.

## Reference(s)

- [How to create an Elasticsearch sink connector on Aiven platform](https://docs.aiven.io/docs/products/kafka/kafka-connect/howto/elasticsearch-sink.html)
- [Git repo for Aiven's Elasticsearch sink connector](https://github.com/aiven/elasticsearch-connector-for-apache-kafka)
