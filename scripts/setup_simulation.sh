#!/bin/bash

# proceso parametros
while [[ $# -gt 0 ]]; do
    case "$1" in
        --files=*)
             FILES="${1#*=}"
            if ! [[ "$FILES" =~ ^[0-9]+$ ]]; then
                echo " Error : --files debe ser un número"
                exit 1
            fi
            shift
	    ;;
        --logs)
            LOGS=1
            shift
            ;;
        --compress)
            COMPRESS=1
            shift
            ;;
        *)
            echo "Parametro desconocido"
            ;;
    esac
done

# Crear estructura de carpetas
echo "Creando carpetas"
mkdir -p app/data
mkdir -p app/logs

echo "Carpetas creadas"

# Creo archivos en app/data si --files lo indica
if [[ "$FILES" -gt 0 ]]; then
    echo "Creando $FILES archivos en /app/data..."
    for i in $(seq 1 "$FILES"); do
        touch "app/data/file_$i.txt"
    done
    echo "$FILES archivos creados en /app/data"
fi

# Creo archivos de logs si  --logs
if [[ "$LOGS" -eq 1 ]]; then
    echo "Habilitando logs en /app/logs..."
    touch "app/logs/log_$(date +%Y%m%d_%H%M%S).txt"
    echo "Logs creados en /app/logs"
fi

# Realizar el backup si  --compress
if [[ "$COMPRESS" -eq 1 ]]; then
    FROM="app"
    TO="output"
    mkdir -p "$TO"

  #data para backup
    THE_DATE=$(date +%Y%m%d_%H%M%S)
    FILE="$FROM/${TO}_backup_$THE_DATE.tar.gz"

    # creo backup compr
    echo "Creando backup de '$FROM' en '$FILE'..."
    tar -czf "$FILE" "$TO"
    echo "Backup comprimido realizado"
fi

