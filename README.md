# Servidor IslasGECI.org

Scripts para mantener el VPS de GECI

## Después de formatear el servidor

1. Permite el tráfico a los puertos 100-9999. (En el futuro debería ser sólo 8000-8999.)
    - En el portal de Azure, en _Network security group > Inbound security rules_ agrega una regla
      para permitir el tráfico a los puertos 100-9999.
    - En DigitalOcean no necesitas hacer cambios.
1. Crea y configura al usuario _ciencia_datos_:
    1. Entra al servidor: `ssh root@islasgeci.org`
    1. Crea usuario: `adduser ciencia_datos`
    1. Agrega usuario a grupo: `usermod -aG sudo ciencia_datos`
    1. Sal del servidor: `exit`
    1. (Si no lo haz hecho, crea tu clave SSH en tu estación de trabajo: `ssh-keygen`)
    1. Agrega tu clave SSH de tu estación de trabajo al servidor: `ssh-copy-id ciencia_datos@islasgeci.org`
1. Configura Ansible en tu estación de trabajo:
    1. Verifica la conexión: `ansible islasgeci --module-name ping`

1. En tu estación de trabajo ejecuta: `ansible-playbook islasgeci.yml`





1. Actualiza el sistema operativo: `sudo apt update && sudo apt full-upgrade --yes && sudo apt
   autoremove --yes`
1. Configura zona horaria: `sudo dpkg-reconfigure tzdata` (selecciona `America/Los_Angeles`)
1. Agrega variables de entorno a `~/.profile` (sustituye <USUARIO> y <CONTRASEÑA> con las
   credenciales correspondientes):
    - `export BITBUCKET_USERNAME=<USUARIO>`
    - `export BITBUCKET_PASSWORD=<CONTRASEÑA>`
1. Instala Make y Docker `sudo apt install --yes make docker.io`
1. Agrega usuario al grupo `docker` para correr Docker sin sudo : `sudo usermod -aG docker $USER`
   (hay que salir y volver a entrar para que los cambios tengan efecto)
1. Prueba la instalación de Docker: `docker run hello-world`
1. Crea un directorio para los repositorios: `mkdir ~/repositorios`
1. Clona el repositorio Servidor: `cd ~/repositorios && git clone
   https://github.com/IslasGECI/servidor.git`
1. Configura crontab: `cd ~/repositorios/servidor && make crontab`
1. Crea archivo para registrar la salida de las tareas realizadas por crontab: `mkdir --parents
   ${HOME}/var/log && touch ${HOME}/var/log/cron.log`
1. Inicia los contenedores: `src/start_containers`
