FROM hashicorp/terraform:latest

RUN apk --no-cache add python3 \
    && python3 -m ensurepip \
    && pip3 install --upgrade pip \
    && pip3 install ansible

WORKDIR /app

COPY . /app

WORKDIR /app/infras

RUN terraform init 

RUN terraform apply 