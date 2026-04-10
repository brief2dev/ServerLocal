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