# vim: ft=dockerfile

FROM usgsastro/debian:latest

RUN apt-get update && apt-get install curl git -y

RUN curl -s \
        -o /tmp/git-lfs.sh \
        https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh && \
    chmod +x /tmp/git-lfs.sh && \
    bash /tmp/git-lfs.sh && \
    rm /tmp/git-lfs.sh && \
    apt-get install git-lfs -y && \
    rm -rf /var/lib/apt/lists/*

