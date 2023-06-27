General Monitoring Infrastructure
====

This is a set of scripts to create a standard monitoring pipeline. Some key points in this repo:

- GitHub Actions for automating CI/CD pipeline
- Terraform and Ansible for creating and building infrastructure (keypair, security group, ec2, nginx, ...)
- Monitor nginx status & statistics with Prometheus and Grafana 

In short, Fluentd will continuously collect NGINX access logs and send them to Prometheus. Prometheus will scrape NGINX metrics endpoints to collect metrics data. Grafana will visualize the collected metrics and provide real-time dashboards for monitoring. You can access these dashboards or retrieve metrics data through the APIs for further analysis or integration with other systems.


## How it works?

To run this, you first need to create an AWS account and then get the `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY`. In order to activate GitHub Actions (if you want), you also need to add these above keys to the repo:
![image](https://github.com/manhph2211/SiMlops/assets/61444616/4bb5f5c5-0b22-403a-a205-3de10257b273)

By the way, make sure you have installed Terraform, and Ansible, then follow the below simple format:

```
cd infras/
terraform init 
terraform apply # also need to enter `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY`
```

In this repo, I did not focus on building APIs, so after all, you should access the EC2 and create ones then use the nginx as the reverse proxy. Monitoring nginx in this situation is more interesting. Below is just some simple metrics from nginx, you can customise some more useful metrics by importing specific JSON file to Grafana dashboard. 

![image](https://github.com/manhph2211/SiMlops/assets/61444616/e8b72842-1e3c-4896-b130-4645c5a7f80d)

Okay, see you in the next template of mine 😄


