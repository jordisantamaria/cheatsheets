```
docker-compose up                        # Starts all services
docker-compose up -d                     # Starts all services in detach mode, so run in background.
docker-compose up [service-name]         # Starts service-name
docker-compose up --build                # Starts and build image "So execute DockerFile file"
docker-compose stop                      # Stop services, services saves It's state, so postgress don't remove tables and data
docker-compose down                      # Remove services completely
docker-compose ps                        # Check which services are running
docker-compose logs                      # Watch docker-compose services logs until now
docker-compose logs -f                   # Follow new docker-compose service logs, keep watching
docker-compose exec [service-name] sh    # Access inside docker service-name image with bash

```







Docker sirve para ejecutar aplicaciones en un sistema operativo personalizado, ese sistema se configura en una docker image con el DockerFile.
En los docker containers, corrremos esa imagen dentro de docker.

More info: https://docker-curriculum.com/#multi-container-environments

# Containers

Maquina virtual que corremos dentro de un docker.

# Containers activos

```bash
docker ps
#or
docker container ls
```

# Run container

```bash
docker run imageName
```

## Opciones

* -it: Nos permite usar comandos de bash.
```bash
docker run -it tempo-batch python3 ./src/pipeline.py Docker
```
Access to docker bash
```bash
docker run -it tempo-batch bash
```
* --rm: Borra el contenedor despues de que se detiene
* -d: Detached mode, nos libera la terminal y ejecuta en segundo plano
* --name: Le asignamos un nombre al contenedor
* -p 8888:80 conectamos nuestro puerto “8888” con el puerto de la maquina “80”
* -P: Linkar el puerto del servidor con un puerto random de nuestra maquina
```bash
docker run -d -P --name static-site prakhar1989/static-site
```
Para saber el puerto que corre
```bash
docker port static-site
```

## Storage, guardando datos en disco

### Compartir carpeta local con docker con -v

-v local:remote

```bash
docker run -v /Users/jordi/Projects/tempo-batch/src/load-to-s3/Output:/home/tempo-batch/src/load-to-s3/Output -it  tempo-batch python3 pipeline.py Docker --rm
```

### Volumenes

Crea un espacio en tu disco duro, donde guardar datos, solo accessible para el contenedor de docker.

* Ver volumenes existentes

```bash
docker volume ls
```

* Cleanup, borrar volumenes existentes

```bash
docker volumne prune
```

* Crear volumen

```bash
docker volume create winboard-data
```

* Usar volumen

--mount src=volumenName,dst=dockerDir

```bash
docker run tempo-batch --mount src=winboard-data,dst=/tempo-batch/src/load/
```

# Logging container

```bash
docker logs containerName
```

# Stop container

```bash
docker stop containerName
```

# Cleanup, borrar containers parados

```bash
docker container prune
```


# Images

Generadas con un DockerFile, usadas para crear contenedores.

## Descargar imagen de hub.docker

```bash
docker pull "imageName"
```

## Listar imagenes

```bash
docker images
#or
docker image ls
```

## Cleanup, Borrar imagenes no usadas

```bash
docker rmi
```

## Crear imagen

### Crear dockerfile

1. Declaramos imagen base de la cual creamos
2. Instalamos librerias necesarias
3. Copiamos el codigo a ejecutar el container en la imagen
4. Instalamos dependencias del codigo.

```dockerfile
FROM python:3.6
# install google chrome
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
RUN sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
RUN apt-get -y update --fix-missing
RUN apt-get install -y google-chrome-stable
# Install requirements first so this step is cached by Docker
COPY /requirements.txt /home/project/requirements.txt
WORKDIR /home/project
RUN pip install -r requirements.txt
COPY . /home/project
```

## Hacer build de dockerfile para crear imagen

docker build -t imageName dockerFileDirectory
```
docker build -t imageName .
```

Imagen es visible después del build con `docker images`

## Ejecutar imagen en container

```
docker run imageName
```

# Cleanup general, limpiar todo lo no usado

```
docker system prune -a
```

# Multiple container, Dockerize app

## Network
Para que multiples containers usen la misma network, hay que crear una network compartida.

## Create

By default, create bridge network, means containers out of network can't connect.

```bash
docker network create foodtrucks-net
```

## List networks created

```bash
docker network ls
```

## Run container in custom network

--net networkName

```
docker run -d --name es --net foodtrucks-net
```

## Docker Compose

Docker compose per defecte crea una network compartida amb tots els serveis.

```
docker-compose up -d
```

### Remove docker-compose container

Per remourel juntament amb els data volumes
```
docker-compose down -v
```

### Dev server

Si enlloc de definir **image**, definim el **build**, docker corre amb el contingut del
directory del build, aixi que escolta a cambis en el codi.

```
version: "3"
services:
  es:
    image: docker.elastic.co/elasticsearch/elasticsearch:6.3.2
    container_name: es
    environment:
      - discovery.type=single-node
    ports:
      - 9200:9200
    volumes:
      - esdata1:/usr/share/elasticsearch/data
  web:
    build: . # replaced image with build
    command: python3 app.py
    environment:
      - DEBUG=True # set an env var for flask
    depends_on:
      - es
    ports:
      - "5000:5000"
    volumes:
      - ./flask-app:/opt/flask-app
volumes:
  esdata1:
    driver: local
```
