ARG ARCH=
FROM ${ARCH}ubuntu

RUN apt-get update \
&& apt install -y curl