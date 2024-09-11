### 📝 Informe de Taller: Despliegue de Microservicios con Vagrant y Docker 🚀

## 🎯 **Objetivo**

El propósito de este taller fue configurar y desplegar una serie de microservicios utilizando Vagrant y Docker. Cada microservicio se ejecuta en su propia máquina virtual (VM), con una red privada establecida para facilitar la comunicación entre ellos. La estrategia incluyó la creación de scripts automatizados para simplificar y agilizar el proceso.

---

### 🛠️ **Requerimientos del Sistema**

Para desplegar y gestionar los microservicios en el entorno descrito, se necesitan los siguientes componentes:

---

#### **1. **Vagrant** 🧳**

- **Descripción:** Vagrant es una herramienta para la construcción y gestión de entornos de desarrollo virtualizados. Permite crear y configurar máquinas virtuales de manera reproducible y eficiente.
- **Requisito:** Debe estar instalado en el sistema. La versión recomendada puede variar según las necesidades del proyecto, pero es importante utilizar una versión que sea compatible con el `Vagrantfile` proporcionado.
- **Instalación:** Se puede descargar e instalar desde el sitio web oficial de [Vagrant](https://www.vagrantup.com/downloads).

#### **2. **VirtualBox** 🖥️**

- **Descripción:** VirtualBox es una herramienta de virtualización que permite ejecutar múltiples sistemas operativos en una sola máquina física. Se utiliza para crear y manejar las máquinas virtuales configuradas por Vagrant.
- **Requisito:** Debe estar instalado en el sistema. Asegúrate de que la versión de VirtualBox sea compatible con la versión de Vagrant que estás utilizando.
- **Instalación:** Se puede descargar e instalar desde el sitio web oficial de [VirtualBox](https://www.virtualbox.org/wiki/Downloads).

---

#### **Ejecución del Despliegue** 🚀

Una vez que ambos componentes estén instalados, puedes iniciar el despliegue de las máquinas virtuales y los microservicios con el siguiente comando:

```bash
vagrant up
```

- **Descripción:** Este comando inicia y configura las máquinas virtuales definidas en el `Vagrantfile`. Se encargará de descargar las boxes necesarias, aplicar las configuraciones y ejecutar los scripts de provisión.

- **Nota:** Asegúrate de ejecutar este comando en el directorio raíz donde se encuentra el `Vagrantfile` para que Vagrant pueda localizar y aplicar las configuraciones correctamente.

Con estos requerimientos y el comando proporcionado, deberías estar listo para desplegar y gestionar tus microservicios de manera efectiva en el entorno virtualizado.
---

### 📁 **Estructura del Repositorio y Comportamiento de Cada Ruta**

A continuación, se detalla el comportamiento de cada ruta en el repositorio y la función de los archivos y directorios en el contexto del despliegue de microservicios.

---

#### **`resources/`**: Directorio raíz que contiene todos los recursos necesarios para los microservicios y scripts de configuración.

- **`auth-api/`**: Contiene el archivo `.env` y los recursos específicos para el servicio de autenticación. Este servicio gestiona la autenticación de usuarios y está configurado a través de su propio archivo de variables de entorno.

- **`frontend/`**: Incluye el archivo `.env` y los recursos del frontend. Este servicio proporciona la interfaz de usuario para interactuar con los microservicios y está configurado para adaptarse a las variables de entorno definidas en su archivo.

- **`general/`**: Carpeta compartida con scripts genéricos utilizados por todos los servicios.
  - **`download_img/image.sh`**: Script para descargar imágenes Docker y ejecutar contenedores. Este script verifica la disponibilidad local de una img/imagen Docker, la descarga si es necesario y luego inicia un contenedor.
  - **`run.sh`**: Script que maneja la ejecución de servicios, carga variables de entorno y configura puertos. Utiliza las variables definidas en el archivo `.env` para ejecutar los contenedores Docker de manera adecuada.
  - **`setup.sh`**: Script para configurar el entorno y verificar la existencia del archivo `.env`. Este script obtiene la URL del repositorio Docker y otros parámetros necesarios para la ejecución.

- **`grafana/`**: Contiene el archivo `.env` y los recursos para Grafana, una herramienta de visualización de datos y panel de control. Configurado con las variables necesarias para su integración con otros servicios.

- **`log-message-processor/`**: Incluye el archivo `.env` y los recursos para el procesador de mensajes de log. Este servicio se encarga de procesar y gestionar logs generados por otros microservicios.

- **`prometheus/`**: Directorio con el archivo `.env` y los recursos para Prometheus, una herramienta de monitoreo y alerta. Configurado para recolectar y almacenar métricas de los servicios.

- **`redis/`**: Contiene el archivo `.env` y los recursos para Redis, un almacén de datos en memoria utilizado para caché y almacenamiento rápido de datos.

- **`todos-api/`**: Incluye el archivo `.env` y los recursos para el servicio de gestión de tareas. Este servicio maneja la creación, actualización y eliminación de tareas en la aplicación.

- **`user-api/`**: Carpeta con el archivo `.env` y los recursos para el servicio de gestión de usuarios. Este servicio gestiona la información de los usuarios, incluyendo la autenticación y autorización.

- **`zipkin/`**: Contiene el archivo `.env` y los recursos para Zipkin, una herramienta de trazado de solicitudes para monitorear y rastrear el flujo de peticiones entre microservicios.

- **`Vagrantfile`**: Archivo de configuración principal de Vagrant. Define las máquinas virtuales, sus configuraciones, la sincronización de carpetas y la provisión de scripts necesarios para desplegar y configurar los microservicios.

---

Cada directorio dentro de `resources/` está diseñado para contener los archivos específicos del microservicio correspondiente, junto con su archivo `.env` para la configuración dinámica. Los scripts en la carpeta `general/` proporcionan funcionalidad común para todos los servicios, simplificando la gestión y despliegue de imágenes Docker.


## 🔧 **Estrategia y Procedimiento**

### 1. **Diseño de la Solución**

Se implementaron tres scripts clave para la automatización:

- **`setup.sh`**: Configura la máquina virtual y el entorno necesario.
- **`run.sh`**: Carga las variables de entorno y ejecuta los servicios.
- **`download_img/image.sh`**: Descarga la img/imagen Docker requerida y levanta el contenedor correspondiente.

![alt text](img/image-3.png)


### 2. **Variables de Entorno Dinámicas**

Cada microservicio tiene su propio archivo `.env`, el cual contiene configuraciones específicas como:
- Nombre de la img/imagen Docker.
- Puertos de escucha y exposición.
- Cantidad de réplicas.

Esto permite una gestión flexible y personalizada de cada servicio sin necesidad de duplicar configuraciones.

![alt text](img/image-4.png)

---

## ⚙️ **Despliegue en Vagrant**

### 1. **Configuración del `Vagrantfile`**

El `Vagrantfile` define múltiples VMs, cada una con su propia configuración de red y carpetas sincronizadas. Cada VM se configura y se despliega usando los scripts Bash genéricos.

![alt text](img/image.png)

### 2. **Red Privada para Comunicación**

Las VMs se comunican a través de una red privada. Esto permite asignar IPs internas para cada servicio, facilitando la interacción sin exponer puertos al exterior.

- **IP privada de Redis**: 192.168.56.11
- **IP privada de Zipkin**: 192.168.56.10
- **IP privada de Prometheus**: 192.168.56.17

![alt text](img/image-5.png)

---

## 🚧 **Problemas Encontrados y Soluciones**

### 1. **Redis no Captaba Eventos Adecuadamente**

**Problema**: Redis no estaba capturando eventos correctamente.

**Solución**: Se ajustó la carga de servicios y la configuración de IPs en la red privada para mejorar la captura de eventos.

> **SCREEN DE ESTE ESCENARIO**: Logs de Redis y la configuración de la red para resolver el problema.

### 2. **Persistencia de Datos en las Máquinas Virtuales**

**Problema**: Las máquinas virtuales retenían datos de despliegues anteriores, complicando las pruebas.

**Solución**: Se implementaron procesos de limpieza automatizados para eliminar datos antiguos y evitar problemas en futuros despliegues.

> **SCREEN DE ESTE ESCENARIO**: Proceso de limpieza de datos persistentes en las VMs.

---

## 📊 **Monitoreo e Integración con Zipkin**

Se integró Zipkin para rastrear y visualizar las peticiones entre microservicios, asegurando una correcta trazabilidad.

---

## 📦 **Despliegue con Docker**

El despliegue de microservicios con Docker fue efectivo, aunque la descarga y ejecución de imágenes podría ser lenta. A pesar de esto, Docker demostró ser una herramienta eficiente para la gestión y ejecución de servicios.

![alt text](img/image-6.png)

---

## ✅ **Conclusión**

El taller logró con éxito el despliegue y configuración de microservicios utilizando Vagrant y Docker. Los desafíos iniciales, como la persistencia de datos y problemas de conexión con Redis, fueron abordados con soluciones efectivas. La automatización con scripts y el uso de variables de entorno dinámicas contribuyeron a un proceso de despliegue más fluido y eficiente.

![alt text](img/image-7.png)
