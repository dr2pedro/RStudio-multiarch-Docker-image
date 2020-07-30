FROM ubuntu:groovy AS base
ENV LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8 DEBIAN_FRONTEND=nointeractive

LABEL maintainer="dr2p@hotmail.com" \
      schema.license="MIT"

RUN apt-get update && apt-get install -y --no-install-recommends \
    libxml2-dev \
    libcurl4-openssl-dev \
    libssl-dev \
    ca-certificates \
    ed \
    fonts-texgyre \
    less \
    locales \wget \
    gcc-9-base \
    libopenblas0-pthread \
    littler \
    r-cran-littler \
    r-base \
    r-base-dev \
    r-recommended \
			&& rm -rf /var/lib/apt/lists/*\
			&& useradd docker \
			&& mkdir /home/docker \
			&& chown docker:docker /home/docker \
			&& addgroup docker staff \
  			&& echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen \
			&& locale-gen en_US.utf8 \
			&& /usr/sbin/update-locale LANG=en_US.UTF-8 \
  			&& ln -s /usr/lib/R/site-library/littler/examples/build.r /usr/local/bin/build.r \
			&& ln -s /usr/lib/R/site-library/littler/examples/check.r /usr/local/bin/check.r \
			&& ln -s /usr/lib/R/site-library/littler/examples/install.r /usr/local/bin/install.r \
			&& ln -s /usr/lib/R/site-library/littler/examples/install2.r /usr/local/bin/install2.r \
			&& ln -s /usr/lib/R/site-library/littler/examples/installBioc.r /usr/local/bin/installBioc.r \
			&& ln -s /usr/lib/R/site-library/littler/examples/installGithub.r /usr/local/bin/installGithub.r \
			&& ln -s /usr/lib/R/site-library/littler/examples/testInstalled.r /usr/local/bin/testInstalled.r \
			&& install.r docopt \
			&& rm -rf /tmp/downloaded_packages/ /tmp/*.rds \
  			&& rm -rf /var/lib/apt/lists/* \
			&& mkdir /usr/Rscripts

WORKDIR /usr/Rscripts

ENTRYPOINT ["R"]
