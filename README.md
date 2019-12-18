# USGS Astro's Docker Images
Base docker images that include DOI's CA in order to prevent TLS errors.
To build, run `docker build` with the root of the repo as the build context.
to specifiy the Dockerfile. Ex (from root of repo): 
`docker build -t centos -f centos/Dockerfile .`


Most images also include a convenience entrypoint that runs all scripts under
`/docker-entrypoint.d` each time the container starts up. This can be useful
for script injection into an existing image.

