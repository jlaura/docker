FROM usgsastro/debian:latest

SHELL ["/bin/bash", "-c"]
ENV HELM_VERSION 3.0.2

RUN apt-get update &&                                   \
    apt-get install -y apt-transport-https curl gnupg2

RUN echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" > /etc/apt/sources.list.d/kubernetes.list &&   \
    curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add - &&                            \
    apt-get update &&                                                                                           \
    apt-get install -y kubectl &&                                                                               \
    rm -rf /var/cache/apt/*

RUN curl -s -o helm.tar.gz https://get.helm.sh/helm-v$HELM_VERSION-linux-amd64.tar.gz &&        \
    curl -s -o helm.sha256 https://get.helm.sh/helm-v$HELM_VERSION-linux-amd64.tar.gz.sha256 && \
    [ "$(cat helm.sha256)" == "$(sha256sum helm.tar.gz | grep -Po '([0-9a-f]+)(?=\s)')" ] &&    \
    tar xvf helm.tar.gz --strip-components 1 -C /usr/local/bin linux-amd64/helm &&              \
    helm repo add stable https://kubernetes-charts.storage.googleapis.com/

 
