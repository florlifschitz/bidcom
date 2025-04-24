#!/bin/bash

if [ $# -lt 1 ]; then
    exit 1
fi

REPO_URL=""
CLEAR=0

for arg in "$@"; do
    if [[ "$arg" == "--clear" ]]; then
        CLEAR=1
    else
        REPO_URL="$arg"
    fi
done

if [[ -z "$REPO_URL" ]]; then
    echo "Error: Colocar la URL del repositorio"
    exit 1
fi

REPO_NAME=$(basename -s .git "$REPO_URL")

if [ ! -d "$REPO_NAME" ]; then
    echo "Clonando repositorio"
    git clone "$REPO_URL"

    if [ $? -ne 0 ]; then
        echo "Error al clonar el repo"
        exit 1
    fi
else
    echo "Ya existe el repo"
fi

echo "Estructura"
if command -v tree &> /dev/null; then
    tree "$REPO_NAME"
else
    echo "Uso find porque tree no esta"
    find "$REPO_NAME"
fi

if [ "$CLEAR" -eq 1 ]; then
    echo "Borrando repo"
    rm -rf "$REPO_NAME"
    echo "Repo eliminado"
fi

