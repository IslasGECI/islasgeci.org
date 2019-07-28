#!/usr/bin/env bash
#
# Corre los contenedores de Docker del servidor islasgeci.org
docker run --detach --publish 5000:5000 --rm --volume ${HOME}/repositorios/tablero/:/workdir tablero
docker run --detach --publish 8080:8888 --rm --volume ${HOME}/nerd-notebooks/:/workdir       islasgeci/jupyter:3691
docker run --detach --publish 8888:8888 --rm --volume ${HOME}/notebooks/:/workdir            islasgeci/jupyter:3691

