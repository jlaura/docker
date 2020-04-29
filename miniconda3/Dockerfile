# vim: ft=dockerfile

FROM continuumio/miniconda3:4.7.12

COPY DOIRootCA2.crt /usr/local/share/ca-certificates/ 
COPY DigiCertCA.crt /usr/local/share/ca-certificates/ 
RUN update-ca-certificates

RUN conda config --set ssl_verify /etc/ssl/certs/ca-certificates.crt
RUN pip config set global.cert /etc/ssl/certs/ca-certificates.crt

