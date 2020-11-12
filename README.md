# baseR-multiarch-Docker-image:update
  
  This repo contains a Dockerfile of R, a statistical software/framework used for data scientists, build upon ubuntu groovy. Periodicaly the Github Action should run the update.R script to check updates in the packages installed, download the artifact of previous build that contains the version of R, compare it and in case of needs a new build, build it, pushes to Docker hub and notify in Slack that a new version exists.

![Build R base Image](https://github.com/dr2pedro/baseR-multiarch-Docker-image/workflows/Build%20R%20base%20Image/badge.svg?branch=master)

# To Know
If you plan to clone this repository automate the build of your own images, like images with pre-installed R libraries, be aware that you will need some secrets:

- Docker hub Token
- Slack Token
- Github Token (to use the Github API)

