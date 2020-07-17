ARG ARCH=
FROM ${ARCH}ubuntu AS base
LABEL maintainer="dr2p@hotmail.com"

RUN apt update \
&& DEBIAN_FRONTEND="noninteractive" apt install --no-install-recommends -y curl gfortran libreadline6-dev libx11-dev \ 
libxt-dev libpng-dev libjpeg-dev libcairo2-dev xvfb libbz2-dev \
libzstd-dev liblzma-dev libcurl4-openssl-dev texinfo texlive \
texlive-fonts-extra screen wget openjdk-8-jdk g++ build-essential\
&& rm -rf /var/lib/apt/lists/* \
&& cd /usr/local/src \
&& wget https://cran.rstudio.com/src/base/R-4/R-4.0.2.tar.gz \
&& tar zxvf R-4.0.2.tar.gz \
&& cd R-4.0.1 \
&& ./configure --enable-R-shlib --with-blas --with-lapack \
&& make \
&& make install \
&& cd .. \
&& rm -rf R-4.0.2*

FROM scratch
COPY --from=base /binary0 /bin

ENTRYPOINT [ "R" ]


