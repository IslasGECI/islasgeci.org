# Servidor IslasGECI.org

Scripts para mantener el VPS de GECI

## Después de formatear el servidor

1. En el portal de Azure, en _Network security group > Inbound security rules_ agrega una regla para permitir el tráfico a los puertos 100-9999. (En el futuro debería ser sólo 8000-8999.)
1. Agrega clave SSH local a servidor: `ssh-copy-id ciencia_datos@islasgeci.org`
1. Actualiza el sistema operativo: `sudo apt update && sudo apt dist-upgrade --yes && sudo apt autoremove --yes`
1. Configura zona horaria: `sudo dpkg-reconfigure tzdata` (selecciona `America/Los_Angeles`)
1. Agrega variables de entorno a `~/.profile` (sustituye <USUARIO> y <CONTRASEÑA> con las credenciales correspondientes):
    - `export BITBUCKET_USERNAME=<USUARIO>`
    - `export BITBUCKET_PASSWORD=<CONTRASEÑA>`
1. Instala Make y Docker `sudo apt install make docker.io`
1. Agrega usuario al grupo `docker` para correr Docker sin sudo : `sudo usermod -aG docker $USER` (hay que salir y volver a entrar para que los cambios tengan efecto)
1. Prueba la instalaciób de Docker: `docker run hello-world`
1. Transfiere los volúmenes de Docker de la máquina anterior a la nueva máquina::
    1. Monta el disco de datos _coronado_ en la nueva máquina virtual
    1. Cambia el directorio de trabajo de Docker al disco _coronado_ siguiendo [estas instrucciones](https://linuxconfig.org/how-to-move-docker-s-default-var-lib-docker-to-another-directory-on-ubuntu-debian-linux)
        - NOTA: La primera vez tuve que copiar los volúmenes manualmente con: `sudo scp -r ciencia_datos@52.175.222.98:/var/lib/docker/volumes /media/coronado/docker/`
1. (NOTA: Creo actualmente que no estamos usando esto) Instala Docker Compose:
    - `sudo curl -L "https://github.com/docker/compose/releases/download/1.24.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose`
    - `sudo chmod +x /usr/local/bin/docker-compose`
1. Crea un directorio para los repositorios: `mkdir ~/repositorios`
1. Clona el repositorio Servidor: `cd ~/repositorios && git clone https://github.com/IslasGECI/servidor.git`
1. Configura crontab: `cd ~/repositorios/servidor && make crontab`
1. Crea archivo para registrar la salida de las tareas realizadas por crontab: `mkdir ~/log && touch ~/log/cron.log`
1. Inicia los contenedores: `servidor/src/start_containers`
