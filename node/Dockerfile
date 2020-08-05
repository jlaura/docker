# vim: ft=dockerfile

FROM node:12

COPY DOIRootCA2.crt /usr/local/share/ca-certificates/ 
COPY DigiCertCA.crt /usr/local/share/ca-certificates/ 
RUN update-ca-certificates && npm config --global set cafile /etc/ssl/certs/ca-certificates.crt
