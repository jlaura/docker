FROM usgsastro/openjdk8:latest

ARG geoserverVersion=2.16.2
ENV GEOSERVER_HOME /usr/share/geoserver
ENV GEOSERVER_DATA_DIR /usr/share/geoserver/data_dir

RUN apt-get update && apt-get install -y    \ 
        unzip                               \ 
        wget                                \
        xorg                                \
    && rm -rf /var/lib/apt/lists/*

RUN wget -qO /tmp/geoserver-${geoserverVersion}-bin.zip                                                                         \
        https://sourceforge.net/projects/geoserver/files/GeoServer/${geoserverVersion}/geoserver-${geoserverVersion}-bin.zip    \
    && unzip /tmp/geoserver-${geoserverVersion}-bin.zip -d /usr/share                                                           \
    && ln -s /usr/share/geoserver-${geoserverVersion} $GEOSERVER_HOME                                                           \
    && rm /tmp/geoserver-${geoserverVersion}-bin.zip

VOLUME $GEOSERVER_DATA_DIR
WORKDIR $GEOSERVER_HOME
ENTRYPOINT ["sh", "-c", "$GEOSERVER_HOME/bin/startup.sh"]

