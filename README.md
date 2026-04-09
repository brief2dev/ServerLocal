
# docker-compose.landing.yml — Static Sites (Multisite Apache)


Este archivo define el servicio **`static-sites`**, encargado de servir múltiples páginas web (landings) desde un solo contenedor utilizando Apache con configuración dinámica.

El contenedor permite manejar múltiples dominios sin necesidad de crear configuraciones individuales (VirtualHosts), gracias al uso de `VirtualDocumentRoot`.


## Concepto clave

Cada dominio corresponde a una carpeta dentro de:

```
/sites
```

Ejemplo:

```
sites/
 ├── blitzc0de.com/
 ├── torrenegra.com/
 ├── santaelena.gob.mx/
```

Apache automáticamente resuelve el dominio solicitado hacia la carpeta correspondiente.


## Servicio definido

Contenedor basado en una imagen personalizada de PHP + Apache, construida desde el `Dockerfile`.

`build: .`
* Construye la imagen local para habilitar módulos necesarios (como `vhost_alias`).

`volumes`
*./sites:/var/www/html
* Contiene todas las páginas web.

`./apache/000-default.conf:/etc/apache2/sites-enabled/000-default.conf`
* Configuración dinámica de Apache.

`infra_net`
* Permite comunicación con otros contenedores (como Nginx Proxy Manager), se creo desde el inicio.
## Cómo agregar un nuevo sitio



```bash
1. Clonar o copiar la landing dentro de `/sites`:
    git clone repo.git sites/nuevodominio.com

2. Crear entrada en NPM para el dominio.

3. Listo — no se requiere reiniciar el contenedor.
```
    
## Run Locally

copiar carpeta a servidor ssh enla raiz(windows)

```bash
    git clone -b NOMBRE_RAMA --single https://github.com/brief2dev/ServerLocal.git .
```

ejecuta docker-compose renombrado 

```bash
  docker compose -f nombre-del-archivo.yml up -d
```

copiar carpeta a servidor ssh enla raiz(windows)

```bash
  scp -r "C:\Users\NAME\Develop\ServerLocal\sites\MISITIO.com" user@IP_SERVIDOR:~
```

en el servidor mover la carpeta a la ruta correcta

```bash
  mv ~/MISITIO.com ~/docker/static-sites/sites/
```


## Este servicio forma parte de la arquitectura general donde

* `static-sites` sirve contenido estático/dinámico ligero
* `apps` contienen los sistemas (backend)
* `infra` gestiona proxy, monitoreo y red


## Consideraciones

* Cada carpeta debe coincidir exactamente con el dominio.
* Cada sitio debe tener un `index.html` o `index.php`.
* No se deben almacenar archivos pesados (PDF, multimedia) en este contenedor.
* El SSL se gestiona desde Nginx Proxy Manager, no desde Apache.


## Ventajas

* Multisite automático sin configuración manual
* Escalable y fácil de mantener
* Compatible con múltiples dominios en un solo contenedor
* Despliegue rápido (solo copiar carpeta)
## Authors

- [@brief2dev](https://www.github.com/brief2dev)

