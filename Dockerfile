FROM ubuntu:latest AS built

RUN apt-get update
RUN apt-get install openjdk-17-jdk -t

COPY . .

RUN apt-get install maven -y
RUN mvn clean install

EXPOSE 8080

COPY --from=built /target/todolist-1.0.0.jar app.jar

ENTRYPOINT [ "java", "-jar", "app.jar" ]