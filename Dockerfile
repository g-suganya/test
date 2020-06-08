FROM gcr.io/lolc-ci-cd/base-image-jre:1.0.0
ARG ARTIFACT
COPY ${ARTIFACT} app.jar
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/app.jar"]