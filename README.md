# Servidor web islasgeci.org

Archivos de código para mantener el VPS de GECI

## Configura tu estación de trabajo:

1. Configura las credenciales del equipo en tu estación de trabajo. ([Ver más
   información.](https://docs.google.com/document/d/1lY7ycXs4J8wp1OyJCmPsvfB7YdQqscqL52cIZxBP6Rw/edit?usp=sharing))
1. Instala Ansible en tu estación de trabajo siguiendo [estas
   instrucciones](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html#installing-ansible-on-ubuntu).
1. Agrega islasgeci.org a tu inventario:
    1. Abre tu inventario para edición: `sudo vim /etc/ansible/hosts`
    1. Agrega la línea: `islasgeci.org ansible_host=islasgeci.org ansible_user=ciencia_datos`
    1. Guarda los cambios y sal del editor
1. (Si no lo haz hecho, crea tu clave SSH: `ssh-keygen`)
1. Agrega la clave SSH de tu estación de trabajo al servidor: `ssh-copy-id
   ciencia_datos@islasgeci.org`

## Configura el servidor

1. Permite el tráfico a los puertos 100-9999. (En el futuro debería ser sólo 8000-8999.)
    - Entra al portal de Azure, en _Network security group > Inbound security rules_ agrega una
      regla para permitir el tráfico a los puertos 100-9999.
1. Configura islasgeci.org mediante Ansible desde tu estación de trabajo:
    1. Verifica la configuración: `ansible islasgeci.org --module-name ping --become`
    1. Clona este repositorio: `git clone https://github.com/IslasGECI/islasgeci.org.git`
    1. Entra al repositorio: `cd islasgeci.org`
    1. Corre el _playbook_: `ansible-playbook ansible-playbook.yml`
