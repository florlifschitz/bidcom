# bidcom

# Construir y correr la imagen 

1. Clonar el repositorio "bidcom"
2. Ejecutar el siguiente comando que permitira construir la imagen localmente:

   `docker build -t bidcom .`

3. Una vez buildeada la imagen, se debe utilizar de la siguiente forma:

   `docker run bidcom [script-que-desea-ejecutar] [parametro]`

   Ejemplos:

   `docker run bidcom diagnose.sh --ping` <br>
   `docker run bidcom setup_simulation.sh --files=3` 
   `docker run bidcom optional_git.sh https://github.com/docker/compose`

   
