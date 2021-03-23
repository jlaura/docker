# vim: ft=dockerfile

FROM node:12.14.0-alpine3.10

# Add CA Certs
RUN apk add ca-certificates bash openssh && rm -rf /var/cache/apk/* &&\
    mkdir -p /usr/local/share/ca-certificates
COPY DOIRootCA2.crt /usr/local/share/ca-certificates/
RUN update-ca-certificates
ENV NODE_EXTRA_CA_CERTS=/usr/local/share/ca-certificates/DOIRootCA2.crt

# Stage 0: Build Cesium
WORKDIR /opt/cesium/
RUN apk add git &&\
    git clone https://github.com/epn-vespa/cesium.git . &&\
    git checkout planetary
COPY cesium/ConfigurationFile.js /opt/cesium/Source/Widgets/ConfigurationFile/ConfigurationFile.js
RUN npm install &&\
    npm run combine &&\
    npm run minifyRelease &&\
    npm run buildPlApps

# Build production container
FROM node:12.14.0-alpine3.10

# Add CA Certs
RUN apk add ca-certificates bash openssh rsync && rm -rf /var/cache/apk/* &&\
    mkdir -p /usr/local/share/ca-certificates
COPY DOIRootCA2.crt /usr/local/share/ca-certificates/
RUN update-ca-certificates
ENV NODE_EXTRA_CA_CERTS=/usr/local/share/ca-certificates/DOIRootCA2.crt

# Copy in Cesium from Stage 0
WORKDIR /opt/cesium/
COPY --from=0 /opt/cesium/ .

ENTRYPOINT ["npm", "start", "--", "--public"]
