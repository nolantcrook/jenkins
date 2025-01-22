FROM jenkins/jenkins:lts-jdk17

USER root

# Install necessary packages
RUN apt-get update && apt-get install -y \
    curl \
    unzip \
    python3 \
    python3-pip \
    && rm -rf /var/lib/apt/lists/*

# Install AWS CLI
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-aarch64.zip" -o "awscliv2.zip" \
    && unzip awscliv2.zip \
    && ./aws/install \
    && rm -rf aws awscliv2.zip

# Install Terraform
RUN curl -L "https://releases.hashicorp.com/terraform/1.7.4/terraform_1.7.4_linux_arm64.zip" -o terraform.zip \
    && unzip terraform.zip \
    && mv terraform /usr/local/bin/ \
    && rm terraform.zip

# Install Terragrunt
RUN curl -L "https://github.com/gruntwork-io/terragrunt/releases/download/v0.55.8/terragrunt_linux_arm64" -o /usr/local/bin/terragrunt \
    && chmod +x /usr/local/bin/terragrunt

USER jenkins 