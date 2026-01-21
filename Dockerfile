#thank you to
#https://medium.com/@RoussiAbdelghani/optimizing-java-base-docker-images-size-from-674mb-to-58mb-c1b7c911f622
#https://snyk.io/blog/jlink-create-docker-images-spring-boot-java/

#build the custom JRE first
FROM eclipse-temurin:24-jdk-alpine AS build

ENV JAR_NAME=my-vertx-docker-example-jar-with-dependencies.jar

#install binutils, required by jlink
RUN apk update && apk add binutils

#create a temp directory to pull in our code, grab our deps
RUN mkdir app/
COPY . app/
WORKDIR app/

# Build small JRE image via jdeps and jlink
## First use jdeps to get the deps and output into a file
RUN $JAVA_HOME/bin/jdeps \
	--ignore-missing-deps \
	-q \
	--recursive \
	--multi-release 24 \
	--print-module-deps \
	--class-path '/target/classes/*' \
	target/$JAR_NAME > deps.info

## Then use jlink to create the custom JRE
RUN $JAVA_HOME/bin/jlink \
         --verbose \
         --add-modules $(cat deps.info)\
         --strip-debug \
         --no-man-pages \
         --no-header-files \
         --compress=2 \
         --output /optimized-jdk

# Second stage, Use the custom JRE and build the app image
FROM alpine:latest
ENV JAVA_HOME=/opt/jdk/jdk-24
ENV PATH="${JAVA_HOME}/bin:${PATH}"

# copy JRE from the base image
COPY --from=build /optimized-jdk $JAVA_HOME

# Add app user
ARG APPLICATION_USER=vertx

# Create a user to run the application, don't run as root
RUN addgroup --system $APPLICATION_USER &&  adduser --system $APPLICATION_USER --ingroup $APPLICATION_USER

# Create the application directory
RUN mkdir /app && chown -R $APPLICATION_USER /app

COPY --chown=$APPLICATION_USER:$APPLICATION_USER target/*-with-dependencies.jar /app/app.jar

# Set the working directory
WORKDIR /app

USER $APPLICATION_USER

ENTRYPOINT ["java", "-jar","/app/app.jar"]
EXPOSE 8080
