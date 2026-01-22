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
<img width="775" height="85" alt="image" src="https://github.com/user-attachments/assets/cd090f00-6b36-4ecd-8d15-48758af2a294" />

woah - if you round down, that's basically 0MB!


## Thanks to:
* https://medium.com/@RoussiAbdelghani/optimizing-java-base-docker-images-size-from-674mb-to-58mb-c1b7c911f622
* https://snyk.io/blog/jlink-create-docker-images-spring-boot-java/
