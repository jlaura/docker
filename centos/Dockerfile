# vim: ft=dockerfile

FROM centos:7

RUN yum install -y ca-certificates && yum clean all
COPY DOIRootCA2.crt /etc/pki/ca-trust/source/anchors/ 
RUN update-ca-trust enable && update-ca-trust extract

RUN mkdir -p /docker-entrypoint.d
COPY docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh
ENTRYPOINT ["/bin/bash", "/docker-entrypoint.sh"]

