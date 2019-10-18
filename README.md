# Servidor IslasGECI.org

Scripts para mantener el VPS de GECI

## Después de formatear el servidor

1. Agrega clave SSH local a servidor: `ssh-copy-id ciencia_datos@islasgeci.org`
1. Actualizamos el sistema operativo: `sudo apt update && sudo apt dist-upgrade`
1. Instalamos Make y Docker `sudo apt install make docker.io`
1. Para correr Docker sin sudo agregamos usuario al grupo docker: `sudo usermod -aG docker $USER`
1. Nos salimos y volvemos a entrar
1. Instalamos Docker Compose:
    1. `sudo curl -L "https://github.com/docker/compose/releases/download/1.24.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose`
    1. `sudo chmod +x /usr/local/bin/docker-compose`
1. Creamos un directorio para los repositorios: `mkdir ~/repositorios`
1. Clonamos el repositorio Servidor: `cd ~/repositorios && git clone https://github.com/IslasGECI/servidor.git`
1. Iniciamos los contenedores: `servidor/src/start_containers.sh`

Otras instucciones:

- `docker volume create gatos-trampas_vol`
- `docker volume create jupyter_vol`
- `docker volume create tablero_api_vol`
