#!/bin/bash

set -e

echo "Iniciando respaldo..."

BASE_DIR=$(pwd)
BACKUP_DIR="$BASE_DIR/backups"
DATE=$(date +"%Y-%m-%d_%H-%M-%S")

mkdir -p $BACKUP_DIR

# =========================
# BACKUP INFRA
# =========================
echo " Respaldando infra ..."

tar -czf $BACKUP_DIR/infra_$DATE.tar.gz docker/infra

# =========================
# BACKUP SITIOS
# =========================
echo " Respaldando sitios..."

tar -czf $BACKUP_DIR/sites_$DATE.tar.gz docker/static-sites/sites

# =========================
# LIMPIEZA (últimos 5 backups)
# =========================
echo "Limpiando respaldo antiguos..."

ls -t $BACKUP_DIR/*.tar.gz | tail -n +6 | xargs -r rm

echo ""
echo "Backup completado: $DATE"