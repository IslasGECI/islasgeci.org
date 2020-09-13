# Servidor web islasgeci.org

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
    1. Permite `sudo` sin contraseña:
        1. Ejecuta `visudo`
        1. Agrega la línea `ciencia_datos ALL=(ALL) NOPASSWD:ALL` al final del archivo
        1. Guarda los cambios y sal del editor
    1. Sal del servidor: `exit`
    1. (Si no lo haz hecho, crea tu clave SSH **en tu estación de trabajo**: `ssh-keygen`)
    1. Agrega la clave SSH de tu estación de trabajo al servidor: `ssh-copy-id ciencia_datos@islasgeci.org`
1. Configura Ansible en tu estación de trabajo:
    1. Instala Ansible en tu estación de trabajo: `sudo apt update && sudo apt install ansible --yes`
    1. Agrega islasgeci.org a tu inventario:
        1. Abre tu inventario para edición: `sudo vim /etc/ansible/hosts`
        1. Agrega la línea: `islasgeci ansible_host=islasgeci.org ansible_user=ciencia_datos`
        1. Guarda los cambios y sal del editor
    1. Verifica la configuración: `ansible islasgeci --module-name ping --become`
1. Configura islasgeci.org mediante Ansible desde tu estación de trabajo:
    1. Clona este repositorio: `git clone https://github.com/IslasGECI/islasgeci.org.git`
    1. Entra al repositorio: `cd islasgeci.org`
    1. Corre el _playbook_: `ansible-playbook .yml`


1. Agrega variables de entorno a `~/.profile` (sustituye <USUARIO> y <CONTRASEÑA> con las
   credenciales correspondientes):
    - `export BITBUCKET_USERNAME=<USUARIO>`
    - `export BITBUCKET_PASSWORD=<CONTRASEÑA>`
1. Crea un directorio para los repositorios: `mkdir ~/repositorios`
1. Clona el repositorio Servidor: `cd ~/repositorios && git clone
   https://github.com/IslasGECI/servidor.git`
1. Configura crontab: `cd ~/repositorios/servidor && make crontab`
1. Crea archivo para registrar la salida de las tareas realizadas por crontab: `mkdir --parents
   ${HOME}/var/log && touch ${HOME}/var/log/cron.log`
1. Inicia los contenedores: `src/start_containers`
