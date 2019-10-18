#!/usr/bin/env bash
#
# Corre los contenedores de Docker del servidor islasgeci.org
#
# Variables:
PATH_TO_REPOS=${HOME}/repositorios
# Actualiza imágenes:
docker pull islasgeci/gatos-trampas:latest
docker pull islasgeci/jupyter:latest
docker pull islasgeci/nerd_demo:latest
docker pull islasgeci/tablero_api:latest
docker pull islasgeci/tablero_front:latest
# Con volumen:
docker run --detach --publish  251:80   --rm --volume gatos-trampas_vol:/go/src/bitbucket.org/IslasGECI/gatos-trampas islasgeci/gatos-trampas:latest ./mapa-gatos
docker run --detach --publish  500:5000 --rm --volume tablero_api_vol:/workdir islasgeci/tablero_api:latest
docker run --detach --publish 8888:8888 --rm --volume jupyter_vol:/workdir islasgeci/jupyter:latest
# Sin volumen:
docker run --detach --publish 5000:80   --rm islasgeci/tablero_front:latest
docker run --detach --publish 8080:8888 --rm islasgeci/nerd_demo:latest
#
cd ${PATH_TO_REPOS}/tamanio-poblacional-aves-marinas && make run
