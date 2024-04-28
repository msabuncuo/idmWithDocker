# IDM with Docker

## Start - docker compose
docker compose up
## Stop - docker compose
docker compose down

### For installation Docker and Docker Compose
#### Docker
https://docs.docker.com/engine/install/ubuntu/

#### Docker Compose
https://docs.docker.com/compose/install/linux/#install-the-plugin-manually

### Configuration for Postgres
https://backstage.forgerock.com/docs/idm/7.2/install-guide/repository-postgresql.html


### Some Docker commands
docker container exec -it postgres_db sh (Connect to Container)

### Some Postgres commands
 - psql -U Postgres (login with user)
 - \du (Shows Db, Roles)
 - \l (Show DB)
