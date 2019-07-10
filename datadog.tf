# Configure the Datadog provider
provider "datadog" {
  api_key = "${var.datadog_api_key}"
  app_key = "${var.datadog_app_key}"
}

resource "datadog_integration_aws" "sandbox" {
   account_id = "${var.AWS_Account_ID}"
   role_name = "DatadogAWSIntegrationRole"
}

output "externalId" {
 value = datadog_integration_aws.sandbox.external_id
}
