FROM openjdk:8-jdk-alpine
COPY *.jar app.jar
VOLUME my-vol
EXPOSE 8080
ENTRYPOINT ["java","-jar","/app.jar"]