# terraform
WORK IN PROGRESS

This Project was written by Ali Shaw & Rich Upshall to help customers adopting Datadog automate their deployment with AWS using Terraform. This is not an official Datadog project - just 2 guys hacking about on a summer's day (or two).

## PREREQUISITES:
### AWS CLI  
First you'll need to [install the AWS CLI based on your platform](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-install.html)  
Once you've installed the AWS CLI, run `aws configure`, you'll then be prompted to [provide credentials](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-configure.html):
```
AWS Access Key ID:
AWS Secret Access Key:
Default region name:
Default output format:
```

### Terraform  
First, [download the Terraform package for your platform](https://www.terraform.io/downloads.html)  
Next, open the directory you downloaded the package to in your terminal of choice and run:
```
unzip terraform.XXX  
mv terraform.XXX /usr/local/bin  
```  
That's it! Check it using `terraform -v`

### Datadog Account  
Datadog is _the_ monitoring and analytics platform built for today’s modern infrastructure & applications.


You must update $DD_API_KEY, $DD_APP_KEY and $AWS_ACCOUNT_ID in `variables.tf`
