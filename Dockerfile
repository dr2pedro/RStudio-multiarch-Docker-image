ARG ARCH=

ENV LC_ALL=en_US.UTF-8 \
    LANG=en_US.UTF-8
    
ENV R_BASE_VERSION=4.0.2-1

FROM ${ARCH}ubuntu:groovy AS base

