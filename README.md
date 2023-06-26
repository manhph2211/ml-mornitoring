General Monitoring Infrastructure
====

This is a set of scripts to create a standard monitoring pipeline. Some key points in this repo:

- GitHub Actions for automating CI/CD pipeline
- Terraform and Ansible for creating and building infrastructure (keypair, security group, ec2, nginx, ...)
- Monitor nginx status & statistics with Prometheus and Grafana 

## How it works?

To run this, you first need to create an AWS account and then get the `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY`. In order to activate GitHub Actions (if you want), you also need to add these above keys to the repo:
![image](https://github.com/manhph2211/SiMlops/assets/61444616/4bb5f5c5-0b22-403a-a205-3de10257b273)

By the way, make sure you have installed Terraform, and Ansible, then follow the below simple format:

```
cd infras/
terraform init 
terraform apply # also need to enter `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY`
```
