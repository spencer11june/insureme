FROM openjdk:11
ARG JAR_FILE=target/*.jar 
COPY ${JAR_FILe} app.jar
ENTRYPOINT ["java", "-jar". "/app.jar]

