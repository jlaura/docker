# USGS Astro's Docker Images
Base docker images that include DOI's CA in order to prevent TLS errors.
To build, run `docker build` with the root of the repo as the build context.
to specifiy the Dockerfile. Ex: `docker build -t centos -f centos/Dockerfile .`.

