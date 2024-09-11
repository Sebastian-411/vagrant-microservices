# 📝 Informe de Prácticas: Despliegue de Servidor Web con Vagrant

## 🎯 Objetivo
El objetivo de esta práctica es desplegar un servidor web en un entorno virtual utilizando Vagrant. Configuraremos una máquina virtual con Ubuntu 18.04 y Apache, y demostraremos cómo acceder al servidor web mediante una red privada configurada con DHCP.

## 🔧 Procedimiento

## 1. 🚀 Inicialización del Entorno

- **Comando:** `vagrant init`
  
  Este comando inicializa un nuevo entorno de Vagrant en el directorio actual. Si es la primera vez que se ejecuta Vagrant en este proyecto, se creará un archivo `Vagrantfile` por defecto. 

- **Nota:** En este caso, ya se proporciona un `Vagrantfile` configurado, por lo que este paso solo es necesario si no se ha configurado previamente.

## 2. 🛠️ Configuración del Vagrantfile

Aquí está el contenido del archivo `Vagrantfile`, que define la configuración de la máquina virtual:


- **🔍 Descripción del `Vagrantfile`**:
  - Se utiliza la imagen base de Ubuntu 18.04 (`ubuntu/bionic64`).
  - Configuración de una red privada usando DHCP para facilitar el acceso al servidor.
  - Instalación automática de Apache durante el aprovisionamiento de la VM mediante una provisión de shell.
  - Sincronización de la carpeta actual con el directorio `/var/www/html` dentro de la VM, para un desarrollo web sencillo.
  - Configuración de la máquina virtual con 1024 MB de memoria RAM.

## 3. 🏃‍♂️ Iniciar la Máquina Virtual

- **Comando:** `vagrant up`
  
  Este comando descarga la imagen base si no está disponible y levanta la máquina virtual según la configuración especificada en el `Vagrantfile`. Durante este proceso, se generarán algunos archivos importantes en el directorio de tu proyecto:

  - **Directorio `.vagrant`**: Este directorio contiene la información de estado de la máquina virtual, como las configuraciones y datos temporales que Vagrant necesita para gestionar la VM. Es fundamental para que Vagrant rastree y controle el estado de la máquina (encendida, apagada, en suspensión, etc.).

  - **Archivo `ubuntu-bionic-18.04-cloudimg-console.log`**: Este archivo de log almacena los mensajes de la consola durante el arranque y la provisión de la máquina virtual. Es útil para diagnosticar problemas o errores que ocurran durante la configuración de la VM, ya que contiene registros detallados de lo que está sucediendo detrás de escena.

## 4. 🔑 Acceso a la Máquina Virtual

- **Comando:** `vagrant ssh -c "hostname -I"`
  
  Se accede a la máquina virtual y se obtiene la dirección IP asignada por DHCP. Esto nos permite confirmar la conectividad y acceder a los servicios desplegados en la máquina virtual.

  ![alt text](resources/image.png)
  ![alt text](resources/image1.png)
## 5. 🌐 Verificación del Despliegue del Servidor

- **Acción:** Acceder a la IP pública proporcionada para confirmar que el servidor Apache se ha desplegado correctamente.
  
  Una vez obtenida la IP, abre un navegador web y escribe la dirección IP. Si todo ha salido bien, deberías ver la página de inicio predeterminada de Apache, ¡indicando que el servidor está en funcionamiento! 🎉

## ✅ Conclusión
En esta práctica, logramos configurar y desplegar un servidor web Apache en un entorno virtualizado usando Vagrant con Ubuntu 18.04. A través de la configuración del archivo `Vagrantfile` y el uso de comandos básicos de Vagrant, pudimos iniciar y acceder a la máquina virtual. Además, verificamos el correcto despliegue del servidor web accediendo a la IP pública asignada. También se generaron archivos importantes como `.vagrant` y `ubuntu-bionic-18.04-cloudimg-console.log`, que son fundamentales para la gestión y depuración de la máquina virtual. Este ejercicio demostró cómo utilizar Vagrant para crear entornos de desarrollo de manera rápida y eficiente. 🌐💻# vagrant-microservices
