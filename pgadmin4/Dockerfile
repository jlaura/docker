FROM dpage/pgadmin4:4

USER root

COPY DOIRootCA2.crt /usr/local/share/ca-certificates/
RUN update-ca-certificates

USER pgadmin
