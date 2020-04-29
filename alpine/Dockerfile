# vim: ft=dockerfile

FROM alpine:3

RUN apk add --update ca-certificates bash && rm -rf /var/cache/apk/* && \
    mkdir -p /usr/local/share/ca-certificates/
COPY DOIRootCA2.crt /usr/local/share/ca-certificates/
COPY DigiCertCA.crt /usr/local/share/ca-certificates/ 
RUN update-ca-certificates &&   \
    rm -f /etc/ssl/cert.pem &&  \
    ln -s /etc/ssl/certs/ca-certificates.crt /etc/ssl/cert.pem

RUN mkdir -p /docker-entrypoint.d
COPY docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh
ENTRYPOINT ["/bin/bash", "/docker-entrypoint.sh"]

