# baseR-multiarch-Docker-image
  
  In this repo i tried to make in a docker image the statistical software R. For that i'm using ubuntu groovy as base. Periodicaly the Github Action should run the update.R script to check updates in the packages installed, download the artifact of previous build that contains the version of R, compare it and in case of needs a new build, build it, pushes to Docker hub and notify in Slack that a new version exists.

![Build R base Image](https://github.com/dr2pedro/baseR-multiarch-Docker-image/workflows/Build%20R%20base%20Image/badge.svg?branch=master)
____________________________________

  Neste repositório, tentei criar em uma imagem do docker o software estatístico R. Para isso, estou usando o ubuntu groovy como base. Periodicamente, o Github Actions deve executar o script update.R para verificar as atualizações nos pacotes instalados, faz o download do artefato da compilação anterior que contém a versão do R, compara e no caso de precisar de uma nova build, builda, envia para o Docker hub e notifica no Slack que existe uma nova versão.
