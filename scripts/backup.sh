#!/bin/bash

# Configuración
BACKUP_DIR="../backups"
CONTAINER="mysql-dev"
DB_USER="root"
DB_PASS="root"
DATE=$(date +"%Y%m%d_%H%M%S")
FILENAME="respaldo-$DATE.sql"

# Crear carpeta si no existe
mkdir -p "$BACKUP_DIR"

# Ejecutar dump desde el contenedor
docker exec $CONTAINER mysqldump -u$DB_USER -p$DB_PASS --all-databases > "$BACKUP_DIR/$FILENAME"

# Verificación
if [ $? -eq 0 ]; then
  echo "✔️ Respaldo guardado en $BACKUP_DIR/$FILENAME"
else
  echo "❌ Error al hacer respaldo"
fi


# Cambiar permisos del script
#chmod +x scripts/backup.sh


# Ejecutar el script
#./scripts/backup.sh