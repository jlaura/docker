# Stage 1
FROM usgsastro/debian:latest

ARG geoserverVersion=2.17.2

RUN apt-get update && apt-get install unzip wget -y 

RUN wget -qO /tmp/geoserver.zip \
     https://sourceforge.net/projects/geoserver/files/GeoServer/${geoserverVersion}/geoserver-${geoserverVersion}-bin.zip 

RUN unzip -d /tmp/geoserver/ /tmp/geoserver.zip

# Stage 2
FROM usgsastro/openjdk8:latest

ARG geoserverVersion=2.17.2

ENV GEOSERVER_HOME /usr/share/geoserver
ENV GEOSERVER_DATA_DIR /var/lib/geoserver
ENV GEOWEBCACHE_CACHE_DIR /tmp/geoserver

RUN apt-get update && apt-get install -y xorg \
    && rm -rf /var/lib/apt/lists/*

COPY --from=0 /tmp/geoserver/ /usr/share/geoserver-${geoserverVersion}

RUN ln -s /usr/share/geoserver-${geoserverVersion} $GEOSERVER_HOME && \
    mkdir /tmp/geoserver && \
    chown www-data:www-data /tmp/geoserver

VOLUME $GEOSERVER_DATA_DIR
VOLUME $GEOWEBCACHE_CACHE_DIR

WORKDIR $GEOSERVER_HOME
ENTRYPOINT ["sh", "-c", "$GEOSERVER_HOME/bin/startup.sh"]

