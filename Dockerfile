FROM ubuntu:20.04

RUN apt-get update && apt-get install -y \
    curl \
    git \
    iputils-ping \
    unzip \
    apt-transport-https \
    ca-certificates \
    gnupg \
    lsb-release

RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
    unzip awscliv2.zip && \
    ./aws/install && \
    rm -rf awscliv2.zip aws

RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" && \
    chmod +x kubectl && \
    mv kubectl /usr/local/bin/

COPY scripts /scripts

RUN chmod +x /scripts/*.sh

WORKDIR /scripts

ENTRYPOINT ["/scripts/entrypoint.sh"]

CMD ["--versions"]
