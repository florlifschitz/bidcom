#!/bin/bash

set -e

case "$1" in
    diagnose.sh|setup_simulation.sh|optional_git.sh)
        SCRIPT="$1"
        shift  
        ;;
    *)
        SCRIPT="diagnose.sh"
        ;;
esac

echo "Ejecutando $SCRIPT con argumentos: $@"
exec ./"$SCRIPT" "$@"

