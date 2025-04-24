# bidcom

# Construir y correr la imagen 

1. Clonar el repositorio "bidcom"
2. Ejecutar el siguiente comando que permitira construir la imagen localmente:

   `docker build -t bidcom .` 

3. Una vez buildeada la imagen, se debe utilizar de la siguiente forma:

   `docker run bidcom [script-que-desea-ejecutar] [parametro]`

   Ejemplos:

   `docker run bidcom diagnose.sh --ping` <br>
   `docker run bidcom setup_simulation.sh --files=3` <br>
   `docker run bidcom optional_git.sh https://github.com/docker/compose` <br>

### Importante 

Si no se indica ningun script especifico en el comando de run de la imagen, la misma ejecutara por default **diagnose.sh** 

### Parametros posibles para cada script 

**diagnose.sh** <br>
`--ping` <br>
`--disk` <br>
`--mem` <br>
`--versions` <br>

**setup_simulation.sh** <br>
`--files=N` <br>
`--log` <br>
`--compress` <br>

**optional_git.sh** <br>
`--clear` <br>

   
