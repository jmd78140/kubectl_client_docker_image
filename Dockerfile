# Set the base image to alpine
FROM alpine

# File Author / Maintainer
MAINTAINER jmd@LearningSystems.ai

# Define default environment variables
ENV KUBECTL_VERSION="v1.30.0"

# Install kubectl
RUN apk add --update ca-certificates \
 && apk add --update -t deps curl \
 && curl -L https://storage.googleapis.com/kubernetes-release/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl -o /usr/local/bin/kubectl \
 && chmod +x /usr/local/bin/kubectl \
 && apk del --purge deps \
 && rm /var/cache/apk/*

# Define main command
ENTRYPOINT ["kubectl"]


