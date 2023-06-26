FROM hashicorp/terraform:latest

# Set the working directory inside the container
WORKDIR /app

# Copy the Terraform configuration files to the container
COPY . /app

# Initialize Terraform
RUN terraform init

# Run Terraform commands when the container starts
CMD ["terraform", "apply", "-auto-approve"]