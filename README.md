General Mornitoring Infrastructure
====

This is a set of scripts to create stardard monitoring pipeline. Some key points in this repo:

- Github Actions for automate CI/CD pipeline
- Terraform and Anisble for create and build infrastructure (keypair, security group, ec2, nginx, ...)
- Monittor nginx status & statistics with prometheus and grafana 

## How it works?

To run this, make sure you have installed terraform, ansible, and created an AWS account (to get `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY`) then follow simple format:

```
cd infras/
terraform init 
terraform apply # enter `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY`
```