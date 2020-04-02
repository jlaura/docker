# https://switch2osm.org/serving-tiles/using-a-docker-container
FROM overv/openstreetmap-tile-server:1.3.10

COPY DOIRootCA2.crt /usr/local/share/ca-certificates/ 
RUN update-ca-certificates

