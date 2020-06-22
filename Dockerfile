ARG ARCH=
FROM ${ARCH}ubuntu

RUN apt update \
&& DEBIAN_FRONTEND="noninteractive" apt install -y curl gfortran libreadline6-dev libx11-dev \ 
libxt-dev libpng-dev libjpeg-dev libcairo2-dev xvfb libbz2-dev \
libzstd-dev liblzma-dev libcurl4-openssl-dev texinfo texlive \
texlive-fonts-extra screen wget openjdk-8-jdk g++ build-essential\
&& cd /usr/local/src \
&& wget https://cran.rstudio.com/src/base/R-4/R-4.0.1.tar.gz \
&& tar zxvf R-4.0.1.tar.gz \
&& cd R-4.0.1 \
&& ./configure --enable-R-shlib --with-blas --with-lapack \
&& make \
&& make install \
&& cd .. \
&& rm -rf R-4.0.1*

ENTRYPOINT [ "R" ]


