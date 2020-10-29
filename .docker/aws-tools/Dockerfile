FROM centos:8.2.2004

LABEL version="0.1.0" \
      description="Development tools for AWS" \
      maintainer="haxyier"

ARG container_user_name
ARG container_uid
ARG container_gid

WORKDIR /tmp

RUN    curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o awscliv2.zip \
    && yum update -y \
    && yum install -y groff-base nodejs unzip \
    && unzip awscliv2.zip \
    && ./aws/install \
    && npm update -g npm \
    && npm install -g serverless serverless-deployment-bucket serverless-plugin-tracing \
    && curl "https://releases.hashicorp.com/terraform/0.13.4/terraform_0.13.4_linux_amd64.zip" -o terraform.zip \
    && unzip terraform.zip \
    && mv terraform /usr/local/bin/ \
    && mkdir -p ~/.terraform.d/plugin-cache \
    && echo "plugin_cache_dir = \"$HOME/.terraform.d/plugin-cache\"" > ~/.terraformrc \
    && useradd --uid $container_uid --non-unique --create-home $container_user_name \
    && groupmod --gid $container_gid $container_user_name \
    && rm -rf /tmp/* \
    && rm -rf /var/cache/dnf/* \
    && yum clean all \
    && npm cache clean --force
