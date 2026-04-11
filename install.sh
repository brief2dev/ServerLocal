#!/bin/bash

set -e  # si algo falla, se detiene

echo "Instalando Server Producccion"

BASE_DIR=$(pwd)
DOCKER_DIR="$BASE_DIR"

echo "Creando estructura base..."

# =========================
# ESTRUCTURA PRINCIPAL
# =========================
mkdir -p $DOCKER_DIR/static-sites/sites
mkdir -p $DOCKER_DIR/webapps
mkdir -p $DOCKER_DIR/infra
mkdir -p $DOCKER_DIR/backups

# =========================
# INFRA (persistencia)
# =========================
mkdir -p $DOCKER_DIR/infra/npm/data
mkdir -p $DOCKER_DIR/infra/npm/letsencrypt

mkdir -p $DOCKER_DIR/infra/portainer/data
mkdir -p $DOCKER_DIR/infra/netdata/config
mkdir -p $DOCKER_DIR/infra/netdata/lib
mkdir -p $DOCKER_DIR/infra/netdata/cache

mkdir -p $DOCKER_DIR/infra/dnscloudflare

# =========================
# PERMISOS
# =========================
echo "Asignando permisos..."
chmod -R 755 $DOCKER_DIR

# =========================
# VALIDAR DOCKER
# =========================
echo " Verificando instalacion Docker..."

if ! command -v docker &> /dev/null
then
    echo "Docker no está instalado"
    exit 1
fi

if ! command -v docker compose &> /dev/null
then
    echo "Docker Compose no está disponible"
    exit 1
fi

echo "Docker ejecutandose"

# =========================
# LEVANTAR SERVICIOS
# =========================
echo "Levantando servicios..."

for dir in $(find $DOCKER_DIR -name "docker-compose.yml" -exec dirname {} \;); do
    echo "Levantando: $dir"
    cd "$dir"
    docker compose up -d
done

cd $BASE_DIR

# =========================
# STATUS FINAL
# =========================
echo ""
echo "Estado de contenedores:"
docker ps

echo ""
echo " Instalación completa"
echo " NPM: http://localhost:81"