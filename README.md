# USGS Astro's Docker Images
Astro's docker images built from verified DockerHub base images. They include 
DOI's CA in order to prevent TLS errors.
To build, run `docker build` with the root of the repo as the build context.
to specifiy the Dockerfile. Ex (from root of repo): 
`docker build -t centos -f centos/Dockerfile .`


Most images also include a convenience entrypoint that runs all scripts under
`/docker-entrypoint.d` each time the container starts up. This can be useful
for script injection into an existing image.


The following images are included
- [usgsastro/alpine](https://hub.docker.com/repository/docker/usgsastro/alpine)
- [usgsastro/centos](https://hub.docker.com/repository/docker/usgsastro/centos)
- [usgsastro/debian](https://hub.docker.com/repository/docker/usgsastro/debian)
- [usgsastro/dind](https://hub.docker.com/repository/docker/usgsastro/dind)
- [usgsastro/fedora](https://hub.docker.com/repository/docker/usgsastro/fedora)
- [usgsastro/jenkins-agent](https://hub.docker.com/repository/docker/usgsastro/jenkins-agent)
- [usgsastro/kube](https://hub.docker.com/repository/docker/usgsastro/kube)
- [usgsastro/maven](https://hub.docker.com/repository/docker/usgsastro/maven)
- [usgsastro/miniconda3](https://hub.docker.com/repository/docker/usgsastro/miniconda3)
- [usgsastro/openjdk8](https://hub.docker.com/repository/docker/usgsastro/openjdk8)
- [usgsastro/osm-tile-server](https://hub.docker.com/repository/docker/usgsastro/osm-tile-server)
- [usgsastro/pgadmin4](https://hub.docker.com/repository/docker/usgsastro/pgadmin4)
- [usgsastro/postgis](https://hub.docker.com/repository/docker/usgsastro/postgis)
- [usgsastro/postgres](https://hub.docker.com/repository/docker/usgsastro/postgres)
- [usgsastro/tomcat](https://hub.docker.com/repository/docker/usgsastro/tomcat)
- [usgsastro/ubuntu](https://hub.docker.com/repository/docker/usgsastro/ubuntu)
