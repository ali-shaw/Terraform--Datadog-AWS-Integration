# Terraform: Integration Datadog & AWS  
This Project was written by Ali Shaw & [Rich Upshall](https://github.com/richupshall) to help customers adopting Datadog automate their deployment with AWS using Terraform. This is not an official Datadog project - just 2 guys hacking about on a summer's day (or two).

## PREREQUISITES:  
### AWS CLI  
You will need to [install the AWS CLI based on your platform](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-install.html)  
Once you've installed the AWS CLI, run `aws configure`, you'll then be prompted to [provide credentials](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-configure.html):
```
AWS Access Key ID:
AWS Secret Access Key:
Default region name:
Default output format:
```

### Terraform  
Go ahead and [download the Terraform package for your platform](https://www.terraform.io/downloads.html)  
Next, open the directory you downloaded the package to in your terminal of choice and run:
```
unzip terraform_VERSION_PLATFORM.zip  
mv terraform_VERSION_PLATFORM /usr/local/bin  
```  
That's it! Check it using `terraform -v`

### Datadog Account  
If you're reading this guide, you most likely already have a Datadog account!  
If not, head over to signup to an account on either our [US hosted instance](https://app.datadoghq.com/signup) or [EU hosted instance](https://app.datadoghq.eu/signup)

## USAGE:  
1) Start by cloning this repository to your local machine:  
`git clone https://github.com/ali-shaw/Terraform--Datadog-AWS-Integration.git`

2) Edit the _variables.tf_ file using your editor of choice to update the 3 values below:  
`$DD_API_KEY`  
`$DD_APP_KEY`  
`$AWS_ACCOUNT_ID`

3) Run `terraform init` to initialise Terraform and download the necessary Providers  
![terraform_init](/images/terraform_init.png)

4) Run `terraform plan` to check the setup. Take a moment to review the plan, you will notice the `+` sign indicating the resources that will be created. Your plan result should have "4 to add" as the Terraform script is doing the following:  
![terraform_plan](/images/terraform_plan.png)  
_Creating the AWS Policy named DatadogAWSIntegrationPolicy_     
_Creating the AWS Role named DatadogAWSIntegrationRole_  
_Attaching the AWS Policy to the AWS Role_  
_Creating the Datadog AWS Integration_  

Note: Terraform uses _explicit dependencies_ to automatically know the order to perform the tasks.

5) Run `terraform apply` followed by `yes` to make the magic happen!
![terraform_apply](/images/terraform_apply.png)

## VALIDATION:  
You can now check you have successfully integrated your Datadog and AWS accounts

### AWS:  
Naviate to the [AWS IAM Policies](https://console.aws.amazon.com/iam/home#/policies) page and confirm that the _DatadogAWSIntegrationPolicy_ was created.
- Review the Policy Summary JSON was successfully written

Navigate to the [AWS IAM Role](https://console.aws.amazon.com/iam/home#/roles) page and confirm that the _DatadogAWSIntegrationRole_ was created.  
- Validate that the Policy was attached
- Validate that the Trust Relationship contains the Datadog AWS Account ID (464622532012) and that the ExternalID Condition was added

### Datadog:
Navigate to the [Datadog AWS Integration](https://app.datadoghq.com/account/settings#integrations/amazon-web-services) tile to confirm it was successfully installed.

Note: if you are on the EU instance, [click here](https://app.datadoghq.eu/account/settings#integrations/amazon-web-services)
