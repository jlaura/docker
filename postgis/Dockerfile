FROM usgsastro/postgres:12

RUN apt-get update && apt-get install -y    \
        postgis                             \
        postgresql-12-postgis-3             \
        postgresql-12-postgis-3-scripts     \
    && rm -rf /var/cache/apt/* &&           \
    rm -rf /var/lib/apt/lists/*


