# vim: ft=dockerfile

FROM alpine:3

RUN apk add --update ca-certificates bash && rm -rf /var/cache/apk/*
RUN mkdir -p /usr/local/share/ca-certificates/doi
COPY DOIRootCA2.crt /usr/local/share/ca-certificates/doi/
RUN update-ca-certificates

RUN mkdir -p /docker-entrypoint.d
COPY docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh
ENTRYPOINT ["/bin/bash", "/docker-entrypoint.sh"]

