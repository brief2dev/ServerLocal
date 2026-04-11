# Docker Server Template

Infraestructura modular basada en Docker para desplegar:

* Sitios estáticos (landings)
* Webapps / APIs
* Infraestructura (Nginx Proxy Manager, Portainer, Netdata, etc.)

Diseñado para ser **escalable, reproducible y fácil de instalar**.

---

#  Estructura del proyecto

```
docker/
 ├── static-sites/     # Sitios web (HTML, React build, etc.)
 │    └── sites/
 │         └── example.com/
 │              └── index.html
 │
 ├── webapps/          # Aplicaciones (APIs, sistemas, etc.)
 │    └── cdn/
 │         └── docker-compose.yml
 |  └── proyecto/
 │         └── docker-compose.yml
 │
 └── infra/            # Servicios base + persistencia
      └── npm/
           └── docker-compose.yml
```

---

#  Requisitos

* Docker
* Docker Compose (v2+)

Verifica:

```
docker -v
docker compose version
```

---

# Instalación

Clona el repositorio:

```
git clone <tu-repo>
cd <tu-repo>
```

Da permisos y ejecuta:

```
chmod +x install.sh
./install.sh
```

Esto hará:

* Crear carpetas necesarias (data, letsencrypt, etc.)
* Asignar permisos
* Levantar todos los servicios automáticamente

---

#  Actualizar servicios

```
chmod +x update.sh
./update.sh
```

* Descarga nuevas imágenes
* Reinicia contenedores sin perder datos

---

#  Backup

```
chmod +x backup.sh
./backup.sh
```

Respalda:

* Infraestructura (`infra/`)
* Sitios (`static-sites/sites/`)

Los backups se guardan en:

```
/backups
```

---

#  Cómo agregar un nuevo servicio

Ejemplo: agregar un CDN

## 1. Crear carpeta

```
docker/webapps/cdn/
```

## 2. Crear `docker-compose.yml`

Ejemplo básico:

```
services:
  cdn:
    image: nginx:alpine
    container_name: cdn
    restart: unless-stopped
    volumes:
      - ./data:/usr/share/nginx/html
    ports:
      - "8080:80"
```

## 3. (Opcional) Crear carpeta de datos

```
mkdir -p docker/webapps/cdn/data
```

---

##  Levantar el nuevo servicio

```
./update.sh
```

✔ El sistema detecta automáticamente el nuevo `docker-compose.yml`
✔ No necesitas modificar scripts

---

#  Convenciones del proyecto

* Cada servicio vive en su propia carpeta
* Cada servicio tiene su propio `docker-compose.yml`
* No existe un compose global

---

#  Qué NO se sube a Git

Estas carpetas se generan automáticamente:

```
docker/infra/**/data/
docker/infra/**/letsencrypt/
docker/infra/**/config/
docker/infra/**/cache/
```

 Agregadas en `.gitignore`

---

#  Filosofía del proyecto

* Git = estructura + código
* Script = preparación del entorno
* Docker = ejecución

---

#  Accesos comunes

* Nginx Proxy Manager → http://localhost:81

---

#  Flujo típico

```
git clone ...
./install.sh
```

Agregar servicio:

```
crear carpeta + docker-compose.yml
./update.sh
```

---

#  Futuras mejoras (opcional)

* Backups automáticos con cron
* CI/CD
* Healthchecks
* Monitoreo avanzado

---

#  Contribución

Puedes extender este template agregando nuevos servicios en:

```
docker/webapps/
docker/infra/
```

Sin modificar scripts existentes.

---

#  TL;DR

```
./install.sh   # instala todo
./update.sh    # actualiza
./backup.sh    # respalda
```

---

