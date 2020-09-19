# Servidor web islasgeci.org

Archivos de código para mantener el VPS de GECI

## Configura tu estación de trabajo:

1. Configura las credenciales del equipo. ([Ver más información.](https://docs.google.com/document/d/1lY7ycXs4J8wp1OyJCmPsvfB7YdQqscqL52cIZxBP6Rw/edit?usp=sharing))
1. Instala Ansible en tu estación de trabajo: `sudo apt update && sudo apt install ansible --yes`
1. Agrega islasgeci.org a tu inventario:
    1. Abre tu inventario para edición: `sudo vim /etc/ansible/hosts`
    1. Agrega la línea: `islasgeci ansible_host=islasgeci.org ansible_user=ciencia_datos`
    1. Guarda los cambios y sal del editor
1. (Si no lo haz hecho, crea tu clave SSH: `ssh-keygen`)

## Configura el servidor

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
    1. Agrega la clave SSH de tu estación de trabajo al servidor: `ssh-copy-id ciencia_datos@islasgeci.org`
1. Configura islasgeci.org mediante Ansible desde tu estación de trabajo:
    1. Verifica la configuración: `ansible islasgeci --module-name ping --become`
    1. Clona este repositorio: `git clone https://github.com/IslasGECI/islasgeci.org.git`
    1. Entra al repositorio: `cd islasgeci.org`
    1. Corre el _playbook_: `ansible-playbook ansible-playbook.yml`
