# baseR-multiarch-Docker-image
  
  In this repo i tried to make a Dockerfile for the statistical software R in the latest version available that could run in my main hardware architectures: arm64 (Raspberry pi 4) and amd64 (Ryzen and FX Vishera). I followed [this](https://www.docker.com/blog/multi-arch-build-and-images-the-simple-way/) instructions to configure the Github Actions for autobuild and for push with tag :latest in my Docker hub. 
  Since in this Dockerfile i needed to compile the code for use in Raspberry pi 4, i coulded only work with two architectures due the SSD limit of 14Gb in the machine of Github Actions. Be aware of it in your personal use. 


____________________________________

  Neste repositório, tentei disponibilizar um Dockerfile para o software estatístico R na versão mais recente que pudesse ser executado nas minhas principais arquiteturas de hardware: arm64 (Raspberry pi 4) e amd64 (Ryzen e FX Vishera). Eu segui as instruções [aqui](https://www.docker.com/blog/multi-arch-build-and-images-the-simple-way/) para configurar as ações do Github para autobuild e para push com a tag :latest no meu Docker hub.
  Como neste Dockerfile eu precisava compilar o código para uso no Raspberry pi 4, eu só pude trabalhar com duas arquiteturas devido ao limite de 14 GB de SSD na máquina do Github Actions. Esteja ciente disso em seu uso pessoal.
