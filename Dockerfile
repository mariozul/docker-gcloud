FROM alpine:latest

LABEL maintainer="Mario Zulkarnain <mario.zulkarnain@gmail.com>"
LABEL version="2.0.0"
LABEL app="gcloud-emulator"

ARG CLOUD_SDK_VERSION=214.0.0

#ENV HOME /
ENV PATH /google-cloud-sdk/bin:$PATH

RUN apk upgrade --update && \
    apk add --update curl python bash && \
    apk add openjdk8-jre-base --update-cache --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted && \
    rm -rf /var/cache/apk/* && \
    curl -O https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-${CLOUD_SDK_VERSION}-linux-x86_64.tar.gz && \
    tar xzf google-cloud-sdk-${CLOUD_SDK_VERSION}-linux-x86_64.tar.gz  && \
    rm google-cloud-sdk-${CLOUD_SDK_VERSION}-linux-x86_64.tar.gz && \
    gcloud config set core/disable_usage_reporting true && \
    gcloud config set component_manager/disable_update_check true && \
    gcloud config set metrics/environment github_docker_image && \
    gcloud --version

RUN gcloud components install --quiet beta

#####################################
# google-cloud-sdk-pubsub-emulator:
#####################################
ARG INSTALL_PUBSUB=false
RUN if [ ${INSTALL_PUBSUB} = true ]; then \
    gcloud components install --quiet pubsub-emulator \
;fi

VOLUME ["/root/.config"]