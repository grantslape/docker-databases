# Homework 1 Writeup
I installed XAMPP and checked it out, however I did not like that I would have to use the web UI to interact with my databases.  I use a database IDE called Datagrip, and prefer to work in that environment.  I've included copies of `docker-compose.yml` as well as creation and insert SQL scripts for both MySQL and PostgreSQL based on the data given in Figures 2.3, 2.4, 2.5.

I wrote the `docker-compose.yml` file which basically sets up a container based on the `mysql:latest` docker image, and a container based on `postgres:11`.  In `docker-compose.yml` we can see root user credentials as well as the port forwarding necessary to access these databases from our own client.

## Usage
With docker and docker-compose installed, getting the containers up and running is simple.  From the project root:
```shell
$ docker-compose build
$ docker-compose up
```
The containers are now running, and can be accessed from the host machine as follows:

### MySQL
For MySQL, we will access the traditional MySQL port 3306 from our host machine by forwarding it to port 39001.  Here is the connection information:
```
Host: localhost:39001
Database: sales
User: root
Password: root
```

### PostgreSQL
For PostgreSQL, we will access the traditional PostgreSQL port 5432 from our host machine by forwarding it to port 39002.  Here is the connection information:
```
Host: localhost:39002
Database: postgres
User: postgres
Password: root
```