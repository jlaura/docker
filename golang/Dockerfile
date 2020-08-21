# vim: ft=dockerfile

FROM golang:1.13

COPY DOIRootCA2.crt /usr/local/share/ca-certificates/ 
COPY DigiCertCA.crt /usr/local/share/ca-certificates/ 
RUN update-ca-certificates

