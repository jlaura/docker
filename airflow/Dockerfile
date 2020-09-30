# vim: ft=dockerfile

FROM apache/airflow:1.10.12-python3.8

ENV PIP_CERT /etc/ssl/certs/ca-certificates.crt

USER root

RUN apt-get update &&                       \
    apt-get install -y ca-certificates &&   \
    rm -rf /var/lib/apt/lists/*             \
    rm -rf /var/cache/apt/*

COPY DOIRootCA2.crt /usr/local/share/ca-certificates/ 
COPY DigiCertCA.crt /usr/local/share/ca-certificates/ 

RUN update-ca-certificates && \
    printf '[global]\ncert = /etc/ssl/certs/ca-certificates.crt\n' > /etc/pip.conf

USER airflow

RUN pip install --user \
    'apache-airflow[password]' \
    'apache-airflow[postgres]' \
    'apache-airflow[kubernetes]'
    
