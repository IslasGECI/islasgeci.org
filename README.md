# Servidor IslasGECI.org

Scripts para mantener el VPS de GECI

## Después de formatear el servidor

1. ssh-copy-id ciencia_datos@52.175.222.98
1. Actualizamos el sistema operativo `sudo apt update && sudo apt dist-upgrade`
1. Instalamos el Make y Docker `sudo apt install make docker.io`
1. Para correr Docker sin sudo (Got permission denied...) agrega tu usuario al grupo docker: `sudo usermod -aG docker $USER`.
1. Nos salimos y volvemos a entrar.
1. `sudo curl -L "https://github.com/docker/compose/releases/download/1.24.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose`
1. `sudo chmod +x /usr/local/bin/docker-compose`
1. `mkdir repositorios`
1. Clonamos el repositorio Servidor: `cd repositorios && git clone https://github.com/IslasGECI/servidor.git`
1. `servidor/src/start_containers.sh`