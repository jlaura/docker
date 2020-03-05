# vim: ft=dockerfile

FROM python:3-slim

COPY DOIRootCA2.crt /usr/local/share/ca-certificates/ 
RUN update-ca-certificates

RUN printf '[global]\ncert = /etc/ssl/certs/ca-certificates.crt\n' > /etc/pip.conf
