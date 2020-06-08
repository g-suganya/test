FROM openjdk:8-jdk
ARG ARTIFACT
COPY ${ARTIFACT} app.jar
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/app.jar"]
