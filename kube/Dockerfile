FROM usgsastro/debian:latest

SHELL ["/bin/bash", "-c"]
ENV HELM_VERSION 3.2.0
ENV RANCHER_CLI_VERSION 2.3.2

RUN apt-get update &&                                   \
    apt-get install -y apt-transport-https curl gnupg2

RUN echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" > /etc/apt/sources.list.d/kubernetes.list &&   \
    curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add - &&                            \
    apt-get update &&                                                                                           \
    apt-get install -y kubectl &&                                                                               \
    rm -rf /var/cache/apt/*

RUN curl -sLo helm.tar.gz https://get.helm.sh/helm-v$HELM_VERSION-linux-amd64.tar.gz &&         \
    curl -sLo helm.sha256 https://get.helm.sh/helm-v$HELM_VERSION-linux-amd64.tar.gz.sha256 &&  \
    [ "$(cat helm.sha256)" == "$(sha256sum helm.tar.gz | grep -Po '^[0-9a-f]+(?=\s)')" ] &&     \
    tar xvf helm.tar.gz --strip-components=1 -C /usr/local/bin linux-amd64/helm &&              \
    rm helm.{tar.gz,sha256} &&                                                                  \
    helm repo add stable https://kubernetes-charts.storage.googleapis.com/

RUN curl -sLo rancher.tar.gz https://github.com/rancher/cli/releases/download/v${RANCHER_CLI_VERSION}/rancher-linux-amd64-v${RANCHER_CLI_VERSION}.tar.gz &&     \
    curl -sLo rancher.sha256 https://github.com/rancher/cli/releases/download/v${RANCHER_CLI_VERSION}/sha256sum.txt &&                                          \
    DESIRED_HASH="$(grep linux-amd64-v${RANCHER_CLI_VERSION}.tar.gz rancher.sha256 | grep -Po '^[0-9a-f]+(?=\s)')"                                              \
    ACTUAL_HASH="$(sha256sum rancher.tar.gz | grep -Po '^[0-9a-f]+(?=\s)')"                                                                                     \
    [ $DESIRED_HASH == $ACTUAL_HASH ] &&                                                                                                                        \
    tar xvf rancher.tar.gz --strip-components=2 -C /usr/local/bin &&                                                                                            \
    rm rancher.{tar.gz,sha256}
 
