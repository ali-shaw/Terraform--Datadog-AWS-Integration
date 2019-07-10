# Configure the AWS Provider
provider "aws" {
  profile = "default"
  region = "eu-west-2"
}

resource "aws_iam_policy" "dd_integration_policy" {
  name        = "DatadogAWSIntegrationPolicy"
  path        = "/"
  description = "DatadogAWSIntegrationPolicy"

  policy = "${var.aws_iam_permissions}"
}

resource "aws_iam_role" "dd_integration_role" {
  name = "DatadogAWSIntegrationRole"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": {
    "Effect": "Allow",
    "Principal": { "AWS": "arn:aws:iam::464622532012:root" },
    "Action": "sts:AssumeRole",
    "Condition": { "StringEquals": { "sts:ExternalId": "${datadog_integration_aws.sandbox.external_id}" } }
  }
}
EOF
depends_on = [datadog_integration_aws.sandbox]
}

resource "aws_iam_policy_attachment" "allow_dd_role" {
  name       = "Allow Datadog PolicyAccess via Role"
  roles      = ["${aws_iam_role.dd_integration_role.name}"]
  policy_arn = "${aws_iam_policy.dd_integration_policy.arn}"
}
