#!/bin/bash

versions() {
    echo "Versiones de herramientas instaladas:"
    declare -A tools=(
        ["bash"]="bash --version | head -n 1"
        ["curl"]="curl --version | head -n 1"
        ["git"]="git --version | head -n 1"
        ["awscli"]="awscli --version| head -n 1"
        ["kubectl"]="kubectl version | head -n 1"
    )
    for tool in "${!tools[@]}"; do
        if command -v "$tool" > /dev/null 2>&1; then
            echo -n "$tool: "
            eval "${tools[$tool]}"
        else
            echo "$tool: No se encuentra instalada"
        fi
    done
}

run_ping() {
    echo "PING"
    ping -c 2 google.com
}

disk() {
    echo "DISK"
    df -h
}

mem() {
    echo "MEM"
    ps aux --sort=-%mem | head -n 6
}

all() {
    echo "ALL"	 
    run_ping
    disk
    mem
    versions
}

# Recorrer todos los parámetros
for arg in "$@"; do
    case $arg in
        --ping)
            run_ping
            ;;
        --disk)
            disk
            ;;
        --mem)
            mem
            ;;
        --versions)
            versions
            ;;
        --all)
            all
            ;;
        *)
            echo "Este parametro no puede ser reconocido"
            exit 1
            ;;
    esac
done

