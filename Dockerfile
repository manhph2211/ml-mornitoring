FROM ubuntu:latest

RUN apt-get update && apt-get install -y \
    curl \
    wget \
    unzip \
    openssh-client \
    python3 \
    python3-pip

RUN curl -fsSL -o terraform.zip https://releases.hashicorp.com/terraform/1.5.1/terraform_1.5.1_linux_amd64.zip && \
    unzip terraform.zip && \
    mv terraform /usr/local/bin/ && \
    rm terraform.zip

RUN pip3 install ansible

WORKDIR /app

COPY . /app

WORKDIR /app/infras

RUN terraform init
RUN TF_VAR_AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID} TF_VAR_AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY} terraform apply