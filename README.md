Docker Sqlite3 to Sql
=====================

> Docker image to use [Sqlite3 to SQL](https://github.com/techouse/sqlite3-to-mysql) without installing it

| CD / CI   | Status |
| --------- | ------ |
| Semaphore CI | [![Build Status](https://sineverba.semaphoreci.com/badges/docker-sqlite3-to-sql/branches/master.svg)](https://sineverba.semaphoreci.com/projects/docker-sqlite3-to-sql) |


## Usage

Commands are the same of `sqlite3-to-mysql` project.

`$ docker run --rm -it -v $(pwd):/usr/src/app sineverba/sqlite3-to-sql sqlite3mysql [COMMAND]`

### Example: basic sqlite conversion for Home Assistant

`$ docker run --rm -it -v $(pwd):/usr/src/app sineverba/sqlite3-to-sql sqlite3mysql -f home-assistant_v2.db -d homeassistant -u homeassistant --mysql-password homeassistant -h 192.168.1.104`


## Github / image tags and versions

| Github / Docker Image tag | Python version | Sqlite3 to SQL version |
| ------------------------- | -------------- | ---------------------- |
| latest | 3.10.0 | 1.4.8 | linux/arm64/v8,linux/amd64,linux/arm/v6,linux/arm/v7 |
| 1.0.0 | 3.10.0 | 1.4.8 | linux/arm64/v8,linux/amd64,linux/arm/v6,linux/arm/v7 |

## Credits

Thank to [techouse](https://github.com/techouse/sqlite3-to-mysql)