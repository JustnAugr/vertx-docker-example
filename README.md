# vertx-docker-example
just run:
```
mvn install
docker-compose up
```
and then open up localhost:8080!

to take it down, just:
```
docker-compose down
```

maven install to create the fat jar w/ deps via the pom.xml plugin
docker-compose handles both the build and run via the .yml & the Dockerfile
