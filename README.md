
# docker-compose.proxy.yml — Infraestructura base (Proxy + Monitoreo)


Este archivo define la **infraestructura principal del servidor Docker**, encargada de:

* Exponer servicios al exterior
* Gestionar dominios y certificados SSL
* Monitorear el servidor
* Administrar contenedores
* Mantener actualizada la IP pública (DDNS)

Es el **punto de entrada de toda la arquitectura**.
## Concepto clave

Este compose levanta la base sobre la cual funcionan todos los demás servicios

Sin este stack, nada es accesible desde internet.

```text
80   → HTTP
81   → Panel admin
443  → HTTPS
```

Apache automáticamente resuelve el dominio solicitado hacia la carpeta correspondiente.


## Servicios

- Nginx Proxy Manager (NPM)
    Servicio principal para gestionar dominios y SSL.
    #### Funciones:

    * Reverse proxy
    * Certificados SSL (Let's Encrypt)
    * Redirecciones y subdominios
    * Panel web de administración
- Portainer
    #### Funciones:
    * Ver contenedores
    * Logs en tiempo real
    * Gestión de imágenes y redes

- Glances
    #### Funciones:
    * CPU, RAM, disco
    * Procesos activos
    * Uso de red
    * Estadísticas en tiempo real

- Cloudflare DDNS
    #### Función:
    * Detecta cambios de IP
    * Actualiza automáticamente registros DNS

- `infra_net`
    ```yaml
    networks:
    infra_net:
        name: infra_net
        driver: bridge
    ```

    Red compartida entre todos los contenedores. 
    
    Permite comunicación interna:

    ```text
    NPM → static-sites
    NPM → apps (igrip)
    NPM → cdn
    ```
## Flujo de tráfico

    ```
            Internet
            ↓
            Cloudflare (DNS)
            ↓
            Nginx Proxy Manager
            ↓
            infra_net
            ├── static-sites (landings)
            ├── apps (sistemas)
            └── otros servicios
    ```
## Levantar infraestructura

copiar carpeta a servidor ssh enla raiz(windows)

```bash
    sudo mkdir docker
    cd docker
    sudo mkdir infra
    cd infra

    clona una rama especifica
        git clone -b produccion --single https://github.com/brief2dev/ServerLocal.git
        git clone -b nombre-rama --single-branch git@github.com:usuario/repositorio.git .
        
    docker compose -f docker-compose.proxy.yml up -d
```
## Resumen

```text
    NPM        → proxy + SSL
    Portainer  → gestión Docker
    Glances    → monitoreo
    DDNS       → IP dinámica
    infra_net  → red interna
```
## Consideraciones

* No exponer servicios directamente (usar NPM)
* Mantener todos los contenedores en `infra_net`
* Respaldar datos críticos (NPM, bases de datos)
* Usar `.env` para variables sensibles



## Ventajas

Este compose establece una base:

    * Escalable
    * Centralizada
    * Segura
    * Replicable en cualquier servidor

## Authors

- [@brief2dev](https://www.github.com/brief2dev)

# Conectar servicios Docker con Nginx Proxy Manager (NPM)

Guía para exponer múltiples sistemas (ej: igrip por municipio) usando dominios y subdominios.

---

# Arquitectura recomendada

Separar siempre:

* Landing (sitio público)
* Sistema (app interna / gestión)

Ejemplo:

```txt
santaelena.gob.mx           → landing
igrip.santaelena.gob.mx    → sistema
```

---

# 1. Requisitos

* Nginx Proxy Manager activo (http://IP:81)
* Servicios Docker corriendo
* Todos conectados a la red `infra_net`
* Dominio configurado en DNS (Cloudflare u otro)

---

# 2. Configurar DNS

Para cada municipio crear:

```txt
A   santaelena.gob.mx        → IP_SERVIDOR
A   igrip.santaelena.gob.mx  → IP_SERVIDOR
```

---

# 3. Verificar red Docker

Tus servicios deben tener:

```yaml
networks:
  - infra_net

networks:
  infra_net:
    external: true
```

---

# 4. Configurar NPM (Landing)

Entrar a:

```txt
http://IP_SERVIDOR:81
```

### Add Proxy Host

* Domain Names:

```txt
santaelena.gob.mx
```

* Scheme:

```txt
http
```

* Forward Hostname / IP:

```txt
static-web
```

* Forward Port:

```txt
80
```

---

# 5. Configurar NPM (Sistema igrip)

### Add Proxy Host

* Domain Names:

```txt
igrip.santaelena.gob.mx
```

* Scheme:

```txt
http
```

* Forward Hostname / IP:

```txt
igrip_se_app
```

* Forward Port:

```txt
80
```

---

# 6. Activar SSL (IMPORTANTE)

En ambos casos (landing y sistema):

* Activar:

  * Request a new SSL Certificate
  * Force SSL
  * HTTP/2 Support

* Email:

```txt
tu@email.com
```

---

# 7. Repetir por municipio

Ejemplo:

```txt
igrip.ticul.gob.mx     → igrip_tc_app
igrip.motul.gob.mx     → igrip_mn_app
```

---

# Problemas comunes

## Error 502 Bad Gateway

Revisar:

```bash
docker ps
```

* contenedor activo
* nombre correcto
* puerto correcto (80)

---

## NPM no encuentra el servicio

```bash
docker network inspect infra_net
```

El contenedor debe aparecer ahí.

---

## No carga SSL

* verificar DNS propagado
* puerto 80 abierto
* dominio accesible

---

# Buenas prácticas

* Un dominio = una responsabilidad
* Landing y sistema separados
* Usar nombres claros:

```txt
igrip_se_app
igrip_tc_app
```

---

#  Flujo completo

```txt
1. Crear DNS (dominio y subdominio)
2. Levantar servicio (docker compose up -d)
3. Configurar Proxy Host en NPM
4. Activar SSL
```

---

# Ejemplo completo

```txt
Dominio: igrip.ticul.gob.mx
Forward: igrip_tc_app
Puerto: 80
```

Resultado:

```txt
https://igrip.ticul.gob.mx
```

---

# Nota final

Nginx Proxy Manager conecta dominios con contenedores.
Mientras estén en la red `infra_net`, puedes exponer cualquier servicio fácilmente.


