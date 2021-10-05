FROM amazon/aws-cli:latest

COPY DOIRootCA2.crt /etc/pki/ca-trust/source/anchors/
COPY DigiCertCA.crt /etc/pki/ca-trust/source/anchors/
RUN update-ca-trust enable && update-ca-trust extract

ENTRYPOINT [""]

