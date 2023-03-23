FROM openjdk:8-jre-alpine

EXPOSE 8080

COPY ./target/demo-app:jma-3.0.jar /usr/app/
WORKDIR /usr/app

ENTRYPOINT ["java", "-jar", "demo-app:jma-3.0.jar"]

