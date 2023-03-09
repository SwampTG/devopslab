FROM maven:3.5-jdk-8 as buildstage

WORKDIR /opt/note
RUN git clone https://github.com/SwampTG/spring-boot-mysql-rest-api-tutorial.git /opt/note && \
  mvn package -DskipTests

FROM openjdk:8-jdk-alpine
WORKDIR /opt/note
RUN addgroup -S notes && adduser -S notes -G notes && \
  chown -R notes:notes /opt/note
USER notes:notes
COPY --from=buildstage /opt/note/target/easy-notes-1.0.0.jar easy-note.jar
COPY application.properties application.properties

ENTRYPOINT ["java", "-jar", "/opt/note/easy-note.jar"]
