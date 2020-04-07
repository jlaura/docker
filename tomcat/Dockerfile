# vim: ft=dockerfile

FROM tomcat:8

RUN apt-get update && \
    apt-get install -y ca-certificates && \
    rm -rf /var/lib/apt/lists/* \
    rm -rf /var/cache/apt/*
COPY DOIRootCA2.crt /usr/local/share/ca-certificates/ 
RUN update-ca-certificates

RUN wget -qO /tmp/java.tar.gz https://download.java.net/openjdk/jdk7u75/ri/jdk_ri-7u75-b13-linux-x64-18_dec_2014.tar.gz && \
    mkdir /usr/local/openjdk-7 && \
    tar xvf /tmp/java.tar.gz -C /usr/local/openjdk-7 --strip-components 1 && \
    rm /tmp/java.tar.gz

ENV JAVA_HOME /usr/local/openjdk-7

RUN keytool -import \
    -keystore $JAVA_HOME/jre/lib/security/cacerts\
    -storepass changeit \
    -file /usr/local/share/ca-certificates/DOIRootCA2.crt \
    -alias DOIRootCert \
    -noprompt

