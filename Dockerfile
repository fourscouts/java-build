FROM ubuntu:latest

RUN apt-get update -yq && apt-get dist-upgrade -yq
RUN apt-get install -yq curl \
  lsb-release && \
  git && \
  openjdk-8-jdk

RUN curl -O https://storage.googleapis.com/kubernetes-release/release/v1.6.6/bin/linux/amd64/kubectl && \
  chmod +x kubectl && \
  mv kubectl /usr/bin

RUN export CLOUD_SDK_REPO="cloud-sdk-$(lsb_release -c -s)" && \
  echo "deb http://packages.cloud.google.com/apt $CLOUD_SDK_REPO main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list && \
  curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add - && \
  apt-get update -yq && \
  apt-get install -yq google-cloud-sdk
