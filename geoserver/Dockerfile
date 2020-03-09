# For an example on how to run this docker container,
# please check the buildDocker.sh script... or just configure and run the script!
# This container creates an instance of GeoServer 2.15.1

FROM usgsastro/openjdk8

ARG geoserverVersion=2.16.2
ENV GEOSERVER_HOME /usr/share/geoserver
ENV GEOSERVER_DATA_DIR /usr/share/geoserver/data_dir
VOLUME $GEOSERVER_DATA_DIR

RUN apt-get update && apt-get install unzip wget -y && rm -rf /var/lib/apt/lists/*

RUN wget -qO /tmp/geoserver-${geoserverVersion}-bin.zip                                                                         \
        https://sourceforge.net/projects/geoserver/files/GeoServer/${geoserverVersion}/geoserver-${geoserverVersion}-bin.zip    \
    && unzip /tmp/geoserver-${geoserverVersion}-bin.zip -d /usr/share                                                           \
    && ln -s /usr/share/geoserver-${geoserverVersion} $GEOSERVER_HOME                                                           \
    && rm /tmp/geoserver-${geoserverVersion}-bin.zip

# Runs the geoserver startup.sh
WORKDIR $GEOSERVER_HOME
ENTRYPOINT ["sh", "-c", "$GEOSERVER_HOME/bin/startup.sh"]
