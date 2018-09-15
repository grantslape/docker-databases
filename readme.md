# Usage
With docker and docker-compose installed, getting the containers up and running is simple.  From the project root:
```shell
$ docker-compose build
$ docker-compose up
```
The containers are now running, and can be accessed from the host machine either via the command line or with your favorite database client.  Anything in the corresponding directory will be mounted into the container, i.e. anything contained in mysql/ will be mounted to /app:

## Command Line
1. SSH into the container:
```shell
$ docker ps
$ docker exec -it CONTAINER_ID /bin/bash
```
2. Run your queries, piped to an output file for example:
```shell
$ mysql -uroot -p --table --comments sales < app/HW2/hw2-select.sql > app/HW2/hw2-output.txt
```
3. Enter root password.
4. Output file should be on host machine now.


## MySQL
For MySQL, we will access the traditional MySQL port 3306 from our host machine by forwarding it to port 39001.  Here is the connection information:
```
Host: localhost:39001
Database: sales
User: root
Password: root
```

## PostgreSQL
For PostgreSQL, we will access the traditional PostgreSQL port 5432 from our host machine by forwarding it to port 39002.  Here is the connection information:
```
Host: localhost:39002
Database: postgres
User: postgres
Password: root
```