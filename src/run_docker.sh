#!/usr/bin/env bash
#
# Corre los contenedores de Docker del servidor islasgeci.org
docker run --detach --publish 251:80    --rm --volume ${HOME}/repositorios/gatos-trampas:/go/src/bitbucket.org/IslasGECI/gatos-trampas gatos-trampas ./mapa-gatos
docker run --detach --publish 500:5000  --rm --volume ${HOME}/repositorios/tablero_api/:/workdir   islasgeci/tablero_api
docker run --detach --publish 5000:80   --rm islasgeci/tablero_front
docker run --detach --publish 8080:8888 --rm --volume ${HOME}/nerd-notebooks/:/workdir             islasgeci/jupyter:3691
docker run --detach --publish 8888:8888 --rm --volume ${HOME}/notebooks/:/workdir                  islasgeci/jupyter:3691
