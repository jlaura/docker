# vim: ft=dockerfile

FROM continuumio/miniconda3:4.10.3

ENV PIP_CERT=/etc/ssl/certs/ca-certificates.crt

COPY DOIRootCA2.crt /usr/local/share/ca-certificates/ 
COPY DigiCertCA.crt /usr/local/share/ca-certificates/ 
RUN update-ca-certificates

RUN conda config --system --set ssl_verify /etc/ssl/certs/ca-certificates.crt && \
    echo 'export PIP_CERT=/etc/ssl/certs/ca-certificates.crt' >> /etc/skel/.bashrc && \
    echo '. /opt/conda/etc/profile.d/conda.sh' >> /etc/skel/.bashrc && \
    echo 'conda activate base' >> /etc/skel/.bashrc

RUN groupadd conda && \    
    bash -ic 'find $CONDA_PREFIX -type d -exec chown root:conda {} \;' && \
    bash -ic 'find $CONDA_PREFIX -type d -exec chmod 775 {} \;'
