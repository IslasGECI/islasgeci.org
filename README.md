# Servidor IslasGECI.org

Scripts para mantener el VPS de GECI

## Después de formatear el servidor

1. Agrega clave SSH local a servidor: `ssh-copy-id ciencia_datos@islasgeci.org`
1. Actualiza el sistema operativo: `sudo apt update && sudo apt dist-upgrade`
1. Configura zona horaria: `sudo dpkg-reconfigure tzdata` (selecciona `America/Los_Angeles`)
1. Agrega variables de entorno a `~/.profile` (sustituye <USUARIO> y <CONTRASEÑA> con las credenciales correspondientes):
    - `export BITBUCKET_USERNAME=<USUARIO>`
    - `export BITBUCKET_PASSWORD=<CONTRASEÑA>`
1. Instala Make y Docker `sudo apt install make docker.io`
1. Agrega usuario al grupo `docker` para correr Docker sin sudo : `sudo usermod -aG docker $USER` (hay que salir y volver a entrar para que los cambios tengan efecto)
1. Crea volúmenes que será unsados por los contenedores:
    - `docker volume create gatos-trampas_vol`
    - `docker volume create jupyter_vol`
    - `docker volume create reproducibility_inspector_vol`
    - `docker volume create secrets_vol`
    - `docker volume create tablero_api_vol`
1. Instala Docker Compose:
    - `sudo curl -L "https://github.com/docker/compose/releases/download/1.24.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose`
    - `sudo chmod +x /usr/local/bin/docker-compose`
1. Crea un directorio para los repositorios: `mkdir ~/repositorios`
1. Clona el repositorio Servidor: `cd ~/repositorios && git clone https://github.com/IslasGECI/servidor.git`
1. Configura crontab: `cd ~/repositorios/servidor && make crontab`
1. Crea archivo para registrar la salida de las tareas realizadas por crontab: `mkdir ~/log && touch ~/log/cron.log`
1. Inicia los contenedores: `servidor/src/start_containers.sh`
