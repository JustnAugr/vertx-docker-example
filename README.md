# vertx-docker-example
just run:
```
mvn install
docker build -t my-vertx-docker-example-jar-with-dependencies.jar .
docker run -p 8080:8080 my-vertx-docker-example-jar-with-dependencies.jar
```
and then open up localhost:8080!

maven install to create the fat jar w/ deps via the pom.xml plugin
docker build with that fat jar to create the image, docker run to run it and expose ourselves on 8080
