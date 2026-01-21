# vertx-docker-example

## Running
just run:
```
mvn install
docker compose up
```
and then open up localhost:8080!

to take it down, just:
```
docker compose down
```

## How it works

* maven install to create the fat jar w/ deps via the pom.xml plugin
* docker-compose handles both the build and run via the .yml & the Dockerfile
* jdeps and jlink to create a minimal JRE

## The Results
<img width="775" height="46" alt="image" src="https://github.com/user-attachments/assets/44e9e211-2c53-4066-927a-0c5a8f645bff" />

woah - if you round down, that's basically 0MB!


## Thanks to:
* https://medium.com/@RoussiAbdelghani/optimizing-java-base-docker-images-size-from-674mb-to-58mb-c1b7c911f622
* https://snyk.io/blog/jlink-create-docker-images-spring-boot-java/
