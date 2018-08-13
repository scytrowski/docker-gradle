FROM alpine

RUN apk update
RUN apk add openjdk8-jre-base

COPY ./app.jar /opt/app.jar

ENTRYPOINT java -jar /opt/app.jar
