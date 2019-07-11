# terraform
WORK IN PROGRESS

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
