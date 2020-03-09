# vim: set ft=dockerfile:

FROM openjdk:8-jre-slim

COPY DOIRootCA2.crt /usr/local/share/ca-certificates/  
RUN update-ca-certificates

