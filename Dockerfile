FROM openjdk:21
ADD target/my-vertx-docker-example-jar-with-dependencies.jar my-vertx-docker-example-jar-with-dependencies.jar
ENTRYPOINT ["java", "-jar","my-vertx-docker-example-jar-with-dependencies.jar"]
EXPOSE 8080