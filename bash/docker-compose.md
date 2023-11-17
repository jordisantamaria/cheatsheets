# Docker compose

```
docker-compose up                        # Starts all services
docker-compose up -d                     # Starts all services in detach mode, so run in background.
docker-compose up [service-name]         # Starts service-name
docker-compose up --build                # Starts and build image "So execute DockerFile file"
docker-compose stop                      # Stop services, services saves It's state, so database don't remove tables and data
docker-compose down                      # Remove services completely
docker-compose build --no-cache          # Recreate a clean docker image, useful when docker env variable changes.
docker-compose ps                        # Check which services are running
docker-compose logs                      # Watch docker-compose services logs until now
docker-compose logs -f                   # Follow new docker-compose service logs, keep watching
docker-compose exec [service-name] sh    # Access inside docker service-name image with bash
docker system prune -a                   # Clean up, delete everthing not currently used
```


