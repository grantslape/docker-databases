# Usage
With docker and docker-compose installed, getting the containers up and running is simple.  From the project root:
```shell
$ docker-compose build
$ docker-compose up
```
The containers are now running, and can be accessed from the host machine as follows:

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