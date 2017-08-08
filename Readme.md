# Docker image for Hortonworks Schema Registry

A Docker image for running Hortonworks Schema Registry with MySQL

http://registry-project.readthedocs.io/en/latest/

## Environment Variables

### DB_USER

MySQL database user. Default registry_user

### DB_NAME

MySQL database name. Default schema_registry

### DB_USER

MySQL user. Default registry_user


### DB_PASSWORD

MySQL password. Default registry_password


### DB_HOST

MySQL user. Default localhost (needs to be provided as image does not have MySQL)


### DB_PORT

MySQL user. Default 3306

## PORT

### 9090

Registry Port

## URLs

Useful links once image is running.


### Main UI

http://localhost:9090


### Swagger UI

http://localhost:9090/api/swagger


## Example Docker Compose

```yaml
version: '2'

services:

  db:
    image: mysql:5.7.17
    ports:
      - "3307:3306"
    volumes:
      - 'mysqldb_data:/var/lib/mysql'
    networks:
      default:
        aliases:
          - db
    environment:
      MYSQL_ROOT_PASSWORD: password
      MYSQL_DATABASE: hortonworks
      MYSQL_USER: hortonworks
      MYSQL_PASSWORD: password


  registry:
    image: thebookpeople/hortonworks-registry:latest
    depends_on:
      - db
    ports:
      - "9090:9090"
    environment:
      DB_NAME: hortonworks
      DB_USER: hortonworks
      DB_PASSWORD: password
      DB_PORT: 3306
      DB_HOST: db


volumes:
  mysqldb_data:
    driver: local
```
